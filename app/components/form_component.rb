class FormComponent < ApplicationComponent

  protected

  def self.tag_prefix
    @tag_prefix ||= "tao"
  end

end
