module ComponentView

  def view
    return @view if @view
    @view = ActionView::Base.new(Rails.configuration.paths["app/views"])
    @view.controller = controller
    @view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end
    @view.instance_eval do
      def current_user
        controller&.current_user
      end

      def logged_in?
        configuration&.logged_in?
      end
    end
    @view
  end

end
