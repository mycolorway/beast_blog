module ApplicationHelper

  def title(page_title)
    content_for(:title) { "#{page_title} - #{ENV['site_name']}" }
    page_title
  end

  def render_avatar(user, width: 32, height: 32)
    image_tag(
      user.avatar.presence || 'avatar.png',
      class: "avatar",
      width: width,
      height: height,
      alt: user.name
    )
  end

end
