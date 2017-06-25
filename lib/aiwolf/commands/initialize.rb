# frozen_string_literal: true

require 'aiwolf/base/try'

module Aiwolf
  module Commands
    module Initialize
      def inner_command_initialize(packet)
        send(:command_initialize, packet[:gameInfo], packet[:gameSetting])
        nil
      end
    end
  end
end
