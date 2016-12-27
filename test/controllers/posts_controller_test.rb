require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts :article
    @user = users :terry
    sign_in_as @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    slug = random_string

    assert_difference('Post.count') do
      post posts_url, params: { post: { content: slug, slug: slug, title: slug } }
    end

    assert_redirected_to post_url(slug)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    slug = random_string

    patch post_url(@post), params: { post: { content: slug, slug: slug, title: slug } }
    assert_redirected_to post_url(slug)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
