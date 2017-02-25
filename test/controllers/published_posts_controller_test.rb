require 'test_helper'

class PublishedPostsControllerTesrt < ActionDispatch::IntegrationTest
  setup do
    @post = posts :article
    @user = users :terry
    sign_in_as @user
  end

  test "post create by slug" do
    assert_not @post.published
    post post_published_posts_path(@post.slug)
    @post.reload
    assert @post.published
  end

  test "post create by id" do
    assert_not @post.published
    post post_published_posts_path(@post)
    @post.reload
    assert @post.published
  end


  test "delete destroy by slug" do
    @post.publish!
    assert @post.published
    delete published_post_path(@post.slug)
    @post.reload
    assert_not @post.published
  end

  test "delete destroy by id" do
    @post.publish!
    assert @post.published
    delete published_post_path(@post)
    @post.reload
    assert_not @post.published
  end
end
