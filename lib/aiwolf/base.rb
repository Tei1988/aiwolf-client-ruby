require 'aiwolf/base/command_parser'
require 'aiwolf/base/logger'

module Aiwolf
  module Base
    include Aiwolf::Base::CommandParser
    include Aiwolf::Base::Logger

    def post_init
      @buffered_data = ''
    end

    def receive_data(data)
      buffered(data).split("\n").each do |json|
        logger.debug(json)
        result = parse_command(JSON.parse(json, symbolize_names: true))
        logger.debug(result)
        send_data("#{result}\n") unless result.nil? or result.empty?
      end
    end

    def unbind
      logger.debug('connection closed')
      EventMachine::stop_event_loop
    end

    private

    def buffered(data)
      (append_data, _v, new_buffered_data) = data.rpartition("\n")
      (@buffered_data + append_data).tap do
        @buffered_data = new_buffered_data
      end
    end

    def try(method, *params)
      if respond_to?(method)
        send(method, *params)
      end
    end
  end
end
