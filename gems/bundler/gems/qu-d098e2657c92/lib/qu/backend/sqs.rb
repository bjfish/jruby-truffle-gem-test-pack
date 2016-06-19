require 'aws/sqs'
require 'securerandom'

module Qu
  module Backend
    class SQS < Base
      def push(payload)
        payload.id = SecureRandom.uuid

        queue = begin
          connection.queues.named(payload.queue)
        rescue ::AWS::SQS::Errors::NonExistentQueue
          connection.queues.create(payload.queue)
        end

        queue.send_message(dump(payload.attributes_for_push))
        payload
      end

      def complete(payload)
        payload.message.delete if payload.message
      end

      def abort(payload)
        payload.message.visibility_timeout = 0 if payload.message
      end

      def fail(payload)
        payload.message.visibility_timeout = 0 if payload.message
      end

      def pop(queue_name = 'default')
        begin
          queue = connection.queues.named(queue_name)

          if message = queue.receive_message
            doc = load(message.body)
            payload = Payload.new(doc)
            payload.message = message
            return payload
          end
        rescue ::AWS::SQS::Errors::NonExistentQueue
        end
      end

      def size(queue_name = 'default')
        begin
          connection.queues.named(queue_name).visible_messages
        rescue ::AWS::SQS::Errors::NonExistentQueue
          0
        end
      end

      def clear(queue_name = 'default')
        begin
          queue = connection.queues.named(queue_name)
          messages = []
          begin
            begin
              messages = queue.receive_message(:limit => 10)
              queue.batch_delete(messages)
            rescue ::AWS::SQS::Errors::BatchDeleteSend
            end
          end while messages.size > 0
        rescue ::AWS::SQS::Errors::NonExistentQueue
          # doesn't exist so no need to flush
        end
      end

      def connection
        @connection ||= ::AWS::SQS.new
      end
    end
  end
end
