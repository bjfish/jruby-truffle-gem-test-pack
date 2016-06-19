require 'qu/version'
require 'qu/logger'
require 'qu/failure'
require 'qu/hooks'
require 'qu/payload'
require 'qu/job'
require 'qu/backend/base'
require 'qu/backend/instrumented'
require 'qu/instrumenters/noop'
require 'qu/runner/direct'
require 'qu/worker'

require 'forwardable'
require 'logger'

module Qu
  InstrumentationNamespace = :qu

  extend SingleForwardable
  extend self

  @interval = 5

  attr_accessor :logger, :graceful_shutdown, :instrumenter, :interval, :runner

  def_delegators :backend, :push, :pop, :complete, :abort, :fail, :size, :clear

  def backend
    @backend || raise("Qu backend not configured. Install one of the backend gems like qu-redis.")
  end

  def backend=(backend)
    @backend = Backend::Instrumented.wrap(backend)
  end

  def configure(&block)
    block.call(self)
  end

  # Internal: Convert an object to json.
  def dump_json(object)
    JSON.dump(object) if object
  end

  # Internal: Convert json to an object.
  def load_json(object)
    JSON.load(object) if object
  end
end

Qu.configure do |config|
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::INFO
  config.instrumenter = Qu::Instrumenters::Noop
  config.runner = Qu::Runner::Direct.new
end
