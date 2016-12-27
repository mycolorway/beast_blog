require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts :article
    @user = users :terry
    sign_in_as @user
  end

  test "should get comments" do
    get post_comments_url(@post.slug), xhr: true
    assert_response :success
  end

end
