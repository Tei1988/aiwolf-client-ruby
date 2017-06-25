module Aiwolf
  module Base
    module Try
      private

      def try(method, *params)
        if respond_to?(method)
          send(method, *params)
        end
      end
    end
  end
end
