# frozen_string_literal: true

require 'aiwolf/base/try'

module Aiwolf
  module Commands
    module Name
      include Aiwolf::Base::Try

      def inner_command_name(_packet)
        try(:command_name) || self.class.to_s
      end
    end
  end
end
