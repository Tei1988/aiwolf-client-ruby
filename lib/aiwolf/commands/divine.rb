# frozen_string_literal: true

module Aiwolf
  module Commands
    module Divine
      def inner_command_divine(packet)
        hash = send(:command_divine, packet[:gameInfo])
        return '' if hash.nil? || hash.empty?
        JSON.generate(hash)
      end
    end
  end
end
