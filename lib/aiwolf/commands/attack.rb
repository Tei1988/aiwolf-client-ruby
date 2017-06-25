module Aiwolf
  module Commands
    module Attack
      def inner_command_attack(packet)
        hash = send(:command_attack, packet[:gameInfo])
        return '' if hash.nil? || hash.empty?
        JSON.generate(hash)
      end
    end
  end
end
