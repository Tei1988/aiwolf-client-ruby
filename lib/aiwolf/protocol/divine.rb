module Aiwolf
  module Protocol
    module Divine
      def inner_command_divine(packet)
        hash = send(:command_divine, packet[:gameInfo])
        return '' if hash.nil? || hash.empty?
        JSON.generate(hash)
      end
    end
  end
end
