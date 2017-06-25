module Aiwolf
  module Commands
    module Initialize
      def inner_command_initialize(packet)
        try(:command_initialize, packet[:gameInfo], packet[:gameSetting])
        nil
      end
    end
  end
end
