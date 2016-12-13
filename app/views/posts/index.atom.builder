atom_feed do |feed|
  feed.title ENV["site_name"]
  feed.updated @posts.maximum(:created_at)

  @posts.each do |post|
    feed.entry post, published: post.created_at do |entry|
      entry.title post.title
      entry.content post.content
      entry.author do |author|
        author.name post.author.name
      end
    end
  end
end
