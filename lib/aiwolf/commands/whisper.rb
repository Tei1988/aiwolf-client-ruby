# frozen_string_literal: true

module Aiwolf
  module Commands
    module Whisper
      def inner_command_whisper(packet)
        send(:command_whisper, packet[:whisperHistory]) || ''
      end
    end
  end
end
