class TaoForm < TaoOnRails::Component
  def render
    view.content_tag('tao-form', self.block_content.html_safe, self.attributes)
  end
end
