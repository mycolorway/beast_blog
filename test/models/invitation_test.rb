require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  attr_reader :email, :invitation, :author_name

  def setup
    @email = "steve.jobs@apple.com"
    @author_name = "Steve Jobs"
    @invitation = Invitation.create(email: @email, name: @author_name)
  end

  test "The neccessary should be initialized" do
    assert_equal 32, invitation.code.size
    assert invitation.email.present?
    assert_not invitation.used
  end

  test "Invitation is activeable" do
    assert_not invitation.used
    assert_nil invitation.author_id

    assert_difference 'User.count', 1 do
      Invitation.active(code: invitation.code, data: { 'password' => '111111'})
    end

    invitation.reload
    author = Author.where(email: email, name: author_name).first
    assert invitation.used
    assert_equal author, invitation.author
  end


end
