require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  attr_reader :author, :session

  def setup
    @author = users :terry
  end

  class OauthLoginTest < SessionTest
    attr_reader :omniauth, :user

    def setup
      super
      @user = author
      @omniauth = mock('omniauth')
      @session = Session.new
      @session.omniauth = omniauth
    end

    test "it should call User.authenticate and return the user" do
      User.expects(:authenticate).with(omniauth).returns(user)
      assert_equal user, session.save
    end

  end

  class PlainPasswordLoginTest < SessionTest
    def setup
      super
      @session = Session.new email: 'poshboytl@gmail.com', password: 'imthesuperman'
    end

    # #save
    test "it should return the authro" do
      assert_equal author, session.save
    end
  end

end
