module PostsHelper

  def post_path_with_slug(post)
    post.slug.present? ? post_path(id: post.slug) : post_path(post)
  end

  def post_title(post)
    post.title.presence || t('posts.no_title')
  end

end
