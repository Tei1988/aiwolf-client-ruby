module Aiwolf
  module Commands
    module Guard
      def inner_command_guard(packet)
        hash = send(:command_guard, packet[:gameInfo])
        return '' if hash.nil? || !hash.empty?
        JSON.generate(hash)
      end
    end
  end
end
