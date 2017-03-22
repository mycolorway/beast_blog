module TaoForm

  class Component < TaoOnRails::Components::Base

    attr_reader :record, :html_options

    def initialize record, options, view
      super options, view
      @record = record
      @html_options = @options.delete(:html) || {}
    end

    def render &block
      view.content_tag self.class.tag_name, view.simple_form_for(record, options, &block), html_options
    end

  end

end
