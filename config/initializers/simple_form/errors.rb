module SimpleForm
  module Components
    module Errors
      protected
      def errors_on_attribute
        object.errors[attribute_name] || []
      end
    end
  end
end
