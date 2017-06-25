# frozen_string_literal: true

module Aiwolf
  module Base
    module Logger
      attr_writer :logger

      def logger
        @logger || ::Logger.new(STDOUT)
      end
    end
  end
end
