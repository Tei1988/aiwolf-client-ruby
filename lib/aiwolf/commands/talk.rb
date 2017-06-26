# frozen_string_literal: true

module Aiwolf
  module Commands
    module Talk
      def inner_command_talk(packet)
        send(:command_talk, packet[:talkHistory]) || ''
      end
    end
  end
end
