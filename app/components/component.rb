class Component

  attr_reader :options, :block, :template_path, :attributes, :locals

  def initialize options = {}, &block
    @options = options
    @block = block
    @template_path = options.delete(:template_path) || default_path
    @attributes = options.delete(:attributes)
    @locals = OpenStruct.new(options.delete(:locals))
  end

  def tag_name
    @tag_name ||= class_name_without_modules.underscore.tr '_', '-'
  end

  def component_name
    class_name_without_modules.underscore
  end

  private

  def default_path
    "components/#{component_name}"
  end

  def class_name_without_modules
    self.class.name.demodulize
  end

end
