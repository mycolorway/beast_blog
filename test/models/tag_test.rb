require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @user =  users :terry
    @post1 = @user.posts.create(title: 'post1', content: 'post1', slug: 'post1')
    @post2 = @user.posts.create(title: 'post2', content: 'post2', slug: 'post2')
    @post3 = @user.posts.create(title: 'post3', content: 'post3', slug: 'post3')
  end

  # .popular
  test "it should list all tags order by articules count DESC" do
    @post1.add_tags 'technology', 'life'
    @post2.add_tags 'technology', 'movie'
    @post3.add_tags 'technology', 'movie'

    assert_equal ['technology', 'movie', 'life'], Tag.popular.to_a.collect(&:name)
  end

end
