module Aiwolf
  module Protocol
    module Initialize
      def inner_command_initialize(packet)
        try(:command_initialize, packet[:gameInfo], packet[:gameSetting])
        nil
      end
    end
  end
end
