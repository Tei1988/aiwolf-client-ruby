module Aiwolf
  module Protocol
    module Whisper
      def inner_command_whisper(packet)
        send(:command_whisper, packet[:gameInfo]) || ''
      end
    end
  end
end
