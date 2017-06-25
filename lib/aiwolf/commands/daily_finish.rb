module Aiwolf
  module Commands
    module DailyFinish
      def inner_command_daily_finish(packet)
        try(:command_daily_finish, packet[:gameInfo])
        nil
      end
    end
  end
end
