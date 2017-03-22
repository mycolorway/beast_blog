class ApplicationComponent < TaoOnRails::Components::Base

  protected

  def self.tag_prefix
    @tag_prefix ||= "beast-#{self.namespace_name.dasherize}"
  end

end
