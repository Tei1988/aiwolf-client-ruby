module Aiwolf
  module Commands
    module Finish
      def inner_command_finish(packet)
        send(:command_finish, packet[:gameInfo])
        EventMachine::stop_event_loop
        nil
      end
    end
  end
end
