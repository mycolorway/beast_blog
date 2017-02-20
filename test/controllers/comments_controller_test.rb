require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts :article
    @user = users :terry
    sign_in_as @user
  end

  test "Create comments" do
    assert_difference('Comment.count', 1) do
      post post_comments_path(@post.slug, params: { comment: {content: 'sofa'} }), xhr: true
      assert_response :success
    end
  end

end
