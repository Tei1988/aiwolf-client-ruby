# frozen_string_literal: true

require 'aiwolf/base/try'

module Aiwolf
  module Commands
    module Role
      include Aiwolf::Base::Try

      def inner_command_role(_packet)
        try(:command_role) || 'none'
      end
    end
  end
end
