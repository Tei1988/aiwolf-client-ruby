module Aiwolf
  module Base
    module CommandParser
      def parse_command(packet)
        logger.debug(packet[:request].downcase)
        send("inner_command_#{packet[:request].downcase}".to_sym, packet)
      end
    end
  end
end
