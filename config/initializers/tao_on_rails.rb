module TaoOnRails
  module ActionView
    module Helpers
      Dir.glob(Rails.root.join('app/components/*')).each do |component| require component end

      Component.descendants.each do |klass|
        instance = klass.new
        module_eval %Q{
          def #{instance.component_name} options = {}, &block
            component = #{klass.name}.new options, controller, &block
            component.render
          end
        }
        end
      end
  end
end

ActiveSupport.on_load :action_view do
  include TaoOnRails::ActionView::Helpers
end
