module ApplicationHelper

  def title(page_title)
    content_for(:title) { "#{page_title} - #{ENV['site_name']}" }
    page_title
  end

  def render_avatar(user, width: 48, height: 48)
    if user.avatar.blank?
      abbr = (user.name =~ /^\w/) ? user.name[0].upcase : user.name[-2, 2]
      content_tag(
        :div, abbr,
        class: 'avatar',
        style: "width: #{width}px; height: #{height}px; line-height: #{height}px; font-size: #{width / 2}px;"
      )
    else
      image_tag(
        user.avatar,
        class: "avatar",
        width: width,
        height: height,
        alt: user.name
      )
    end
  end

end
