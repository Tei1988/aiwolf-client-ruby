module Aiwolf
  module Protocol
    module Role
      def inner_command_role(packet)
        try(:command_role) || 'none'
      end
    end
  end
end
