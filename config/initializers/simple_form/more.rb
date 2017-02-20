module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module More
      # Name of the component method
      def more(wrapper_options = nil)
        @more ||= begin
          if options[:more].present?
            %{<svg class="icon icon-arrow-right"><use xlink:href="#icon-arrow-right"/></svg>}.html_safe
          else
            false
          end
        end
      end

      # Used when the more is optional
      def has_more?
        more.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::More)
