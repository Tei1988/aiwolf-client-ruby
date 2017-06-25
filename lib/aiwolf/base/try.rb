# frozen_string_literal: true

module Aiwolf
  module Base
    module Try
      private

      def try(method, *params)
        send(method, *params) if respond_to?(method)
      end
    end
  end
end
