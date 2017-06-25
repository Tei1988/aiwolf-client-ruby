module Aiwolf
  module Protocol
    module Talk
      def inner_command_talk(packet)
        send(:command_talk, packet[:gameInfo]) || ''
      end
    end
  end
end
