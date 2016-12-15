require 'test_helper'

class PostTest < ActiveSupport::TestCase

  # #to_slug
  test "it should generate right slug" do
    post = Post.new(slug: "I'll be there with you & your family @ super_home. nice home")

    assert_equal "Ill-be-there-with-you-and-your-family-at-super-home-nice-home", post.to_slug

  end
end
