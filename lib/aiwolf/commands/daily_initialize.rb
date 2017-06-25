module Aiwolf
  module Commands
    module DailyInitialize
      def inner_command_daily_initialize(packet)
        try(:command_daily_initialize, packet[:gameInfo])
        nil
      end
    end
  end
end
