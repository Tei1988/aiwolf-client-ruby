module Aiwolf
  module Commands
    module Name
      def inner_command_name(packet)
        try(:command_name) || self.class.to_s
      end
    end
  end
end
