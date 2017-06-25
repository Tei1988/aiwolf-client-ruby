require 'aiwolf/base/command_parser'
require 'aiwolf/base/logger'

module Aiwolf
  module Base
    include EventMachine::Protocols::LineProtocol

    include Aiwolf::Base::CommandParser
    include Aiwolf::Base::Logger

    def receive_line(data)
      logger.debug(data)
      result = parse_command(JSON.parse(data, symbolize_names: true))
      logger.debug(result)
      send_data("#{result}\n") unless result.nil? or result.empty?
    end

    def unbind
      logger.debug('connection closed')
      EventMachine::stop_event_loop
    end
  end
end
