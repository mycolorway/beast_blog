require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts :article
  end

  # #to_slug
  test "it should generate right slug" do
    post = Post.new(slug: "I'll be there with you & your family @ super_home. nice home")

    assert_equal "Ill-be-there-with-you-and-your-family-at-super-home-nice-home", post.to_slug

  end

  # #add_tags
  test "it should add tags to a post" do
    @post.add_tags 'meinv', 'beautiful girl'
    assert_equal ['meinv', 'beautiful girl'], @post.tags.collect(&:name)
  end

  # .tag_with
  test "it should return the post with specific tags" do
    @post.add_tags 'meinv', 'beautiful girl'
    assert_equal [@post], Post.tag_with('meinv').to_a
  end
end
