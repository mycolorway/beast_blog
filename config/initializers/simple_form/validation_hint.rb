module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module ValidationHints
      # Name of the component method
      def validation_hint(wrapper_options = nil)
        @validation_hint ||= begin
          options[:validation_hint].to_s.html_safe if options[:validation_hint].present?
        end
      end

      # Used when the validation_hint is optional
      def has_validation_hint?
        validation_hint.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::ValidationHints)
