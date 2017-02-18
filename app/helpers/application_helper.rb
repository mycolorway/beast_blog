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

    # abbr = (user.name =~ /^\w/) ? user.name[0].upcase : user.name[-2, 2]
    # content_tag(
    #   :div, abbr,
    #   class: 'avatar',
    #   style: "width: #{width}px; height: #{height}px; line-height: #{height}px; font-size: #{width / 2}px;"
    # )
  end

end
