module Aiwolf
  module Protocol
    module Attack
      def inner_command_attack(packet)
        send(:command_attack, packet[:gameInfo]) || ''
      end
    end
  end
end
