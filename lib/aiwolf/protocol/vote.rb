module Aiwolf
  module Protocol
    module Vote
      def inner_command_vote(packet)
        hash = send(:command_vote, packet[:gameInfo])
        return '' if hash.nil? || hash.empty?
        JSON.generate(hash)
      end
    end
  end
end
