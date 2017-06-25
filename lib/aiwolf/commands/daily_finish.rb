require 'aiwolf/base/try'

module Aiwolf
  module Commands
    module DailyFinish
      include Aiwolf::Base::Try

      def inner_command_daily_finish(packet)
        try(:command_daily_finish, packet[:gameInfo])
        nil
      end
    end
  end
end
