class Beaneater
  # Exception to stop processing jobs during a `process!` loop.
  # Simply `raise AbortProcessingError` in any job process handler to stop the processing loop.
  class AbortProcessingError < RuntimeError; end

  # Represents collection of job-related commands.
  class Jobs

    # @!attribute processors
    #   @return [Array<Proc>] returns Collection of proc to handle beanstalkd jobs
    # @!attribute client
    #   @return [Beaneater] returns the client instance
    # @!attribute current_job
    #   @return [Beaneater] returns the currently processing job in the process loop
    attr_reader :processors, :client, :current_job

    # Number of retries to process a job.
    MAX_RETRIES = 3

    # Delay in seconds before to make job ready again.
    RELEASE_DELAY = 1

    # Number of seconds to wait for a job before checking a different server.
    RESERVE_TIMEOUT = nil

    # Creates new jobs instance.
    #
    # @param [Beaneater] client The beaneater client instance.
    # @example
    #  Beaneater::Jobs.new(@client)
    #
    def initialize(client)
      @client = client
    end

    # Delegates transmit to the connection object.
    #
    # @see Beaneater::Connection#transmit
    def transmit(command, options={})
      client.connection.transmit(command, options)
    end

    # Peek (or find) job by id from beanstalkd.
    #
    # @param [Integer] id Job id to find
    # @return [Beaneater::Job] Job matching given id
    # @example
    #   @beaneater.jobs[123] # => <Beaneater::Job>
    #   @beaneater.jobs.find(123) # => <Beaneater::Job>
    #   @beaneater.jobs.peek(123) # => <Beaneater::Job>
    #
    # @api public
    def find(id)
      res = transmit("peek #{id}")
      Job.new(client, res)
    rescue Beaneater::NotFoundError
      nil
    end
    alias_method :peek, :find
    alias_method :[], :find

    # Register a processor to handle beanstalkd job on particular tube.
    #
    # @param [String] tube_name Tube name
    # @param [Hash{String=>RuntimeError}] options settings for processor
    # @param [Proc] block Process beanstalkd job
    # @option options [Integer] max_retries Number of retries to process a job
    # @option options [Array<RuntimeError>] retry_on Collection of errors to rescue and re-run processor
    #
    # @example
    #   @beanstalk.jobs.register('some-tube', :retry_on => [SomeError]) do |job|
    #     do_something(job)
    #   end
    #
    #   @beanstalk.jobs.register('other-tube') do |job|
    #     do_something_else(job)
    #   end
    #
    # @api public
    def register(tube_name, options={}, &block)
      @processors ||= {}
      max_retries = options[:max_retries] || MAX_RETRIES
      retry_on = Array(options[:retry_on])
      @processors[tube_name.to_s] = { :block => block, :retry_on => retry_on, :max_retries => max_retries }
    end

    # Sets flag to indicate that process loop should stop after current job
    def stop!
      @stop = true
    end

    # Returns whether the process loop should stop
    #
    # @return [Boolean] if true the loop should stop after current processing
    def stop?
      !!@stop
    end

    # Watch, reserve, process and delete or bury or release jobs.
    #
    # @param [Hash{String => Integer}] options Settings for processing
    # @option options [Integer] release_delay Delay in seconds before to make job ready again
    # @option options [Integer] reserve_timeout Number of seconds to wait for a job before checking a different server
    #
    # @api public
    def process!(options={})
      release_delay = options.delete(:release_delay) || RELEASE_DELAY
      reserve_timeout = options.delete(:reserve_timeout) || RESERVE_TIMEOUT
      client.tubes.watch!(*processors.keys)
      while !stop? do
        begin
          @current_job = client.tubes.reserve(reserve_timeout)
          processor = processors[@current_job.tube]
          begin
            processor[:block].call(@current_job)
            @current_job.delete
          rescue *processor[:retry_on]
            if @current_job.stats.releases < processor[:max_retries]
              @current_job.release(:delay => release_delay)
            end
          end
        rescue AbortProcessingError
          break
        rescue Beaneater::JobNotReserved, Beaneater::NotFoundError, Beaneater::TimedOutError
          retry
        rescue StandardError # handles unspecified errors
          @current_job.bury if @current_job
        ensure # bury if still reserved
          @current_job.bury if @current_job && @current_job.exists? && @current_job.reserved?
          @current_job = nil
        end
      end
    end # process!
  end # Jobs
end # Beaneater
