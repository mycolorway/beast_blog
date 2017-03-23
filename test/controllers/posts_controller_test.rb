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
    assert_response :redirect
  end

  test "should create post" do
    slug = random_string

    assert_difference('Post.count') do
      post posts_url, params: { post: { content: slug, slug: slug, title: slug } }, xhr: true
    end

  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post.slug)
    assert_response :success
  end

  test "should update post" do
    slug = random_string

    patch post_url(@post), params: { post: { content: slug, slug: slug, title: slug } }, xhr: true

    assert_response :success

    @post.reload
    assert_equal slug, @post.content
    assert_equal slug, @post.title
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post), xhr: true
      assert_response :success
    end
  end
end
