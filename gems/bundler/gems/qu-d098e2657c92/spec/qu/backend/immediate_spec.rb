require 'spec_helper'
require 'qu-immediate'

describe Qu::Backend::Immediate do
  let(:payload) { Qu::Payload.new(:klass => SimpleJob) }

  it 'performs immediately' do
    payload.should_receive(:perform)
    subject.push(payload)
  end

  it_should_behave_like 'a backend interface'
end
