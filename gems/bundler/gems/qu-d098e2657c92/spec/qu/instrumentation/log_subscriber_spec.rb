require 'spec_helper'
require 'qu/backend/redis'
require 'qu/instrumentation/log_subscriber'

describe Qu::Instrumentation::LogSubscriber do
  let(:io) { StringIO.new }
  let(:log) { io.string }

  before(:each) do
    Qu.backend = Qu::Backend::Redis.new
    Qu.clear
    @original_instrumenter = Qu.instrumenter
    Qu.instrumenter = ActiveSupport::Notifications
    described_class.logger = Logger.new(io).tap { |logger|
      logger.formatter = proc { |severity, datetime, progname, msg| "#{msg}\n" }
    }
  end

  after(:each) do
    Qu.instrumenter = @original_instrumenter
    described_class.logger = nil
  end

  it "logs empty pop" do
    worker = Qu::Worker.new
    worker.work
    line = find_line('Qu pop')
    line.should include("queue_name=default")
  end

  it "logs pop with payload" do
    payload = SimpleJob.create
    worker = Qu::Worker.new
    worker.work
    line = find_line('Qu pop')
    line.should include("queue_name=default payload=#{payload}")
  end

  it "logs push" do
    payload = SimpleJob.create
    line = find_line('Qu push')
    line.should include(payload.to_s)
  end

  it "logs perform" do
    payload = SimpleJob.create
    payload.perform
    line = find_line('Qu perform')
    line.should include(payload.to_s)
  end

  it "logs complete" do
    payload = SimpleJob.create
    payload.perform
    line = find_line('Qu complete')
    line.should include(payload.to_s)

    # should not get to abort
    expect { find_line('Qu abort') }.to raise_error
  end

  it "logs abort" do
    payload = SimpleJob.create
    payload.job.stub(:perform).and_raise(Qu::Worker::Abort.new)
    begin
      payload.perform
      flunk # should not get here
    rescue Qu::Worker::Abort
      line = find_line('Qu abort')
      line.should include(payload.to_s)

      # should not get to complete
      expect { find_line('Qu complete') }.to raise_error
    end
  end

  it "logs fail" do
    payload = SimpleJob.create
    payload.job.stub(:perform).and_raise(StandardError.new)

    begin
      payload.perform
      flunk # should not get here
    rescue => exception
      line = find_line('Qu fail')
      line.should include(payload.to_s)

      # should not get to complete
      expect { find_line('Qu complete') }.to raise_error
    end
  end

  def find_line(str)
    regex = /#{Regexp.escape(str)}/
    lines = log.split("\n")
    lines.detect { |line| line =~ regex } ||
      raise("Could not find line matching #{str.inspect} in #{lines.inspect}")
  end

  def clear_logs
    io.string = ''
  end
end
