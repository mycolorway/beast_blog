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
      invitation.password = '111111'
      invitation.active
    end

    invitation.reload
    author = Author.where(email: email, name: author_name).first
    assert invitation.used
    assert_equal author, invitation.author
  end

  test "Only the name and password present, it's ready" do
    assert_not invitation.ready?
    invitation.attributes = { password: '111111' }
    assert invitation.ready?
  end

  test "only unsued and un expired invitation is available" do
    assert invitation.available?

    invitation.update_attribute :used, :true
    assert_not invitation.available?

    invitation.update_attributes(used: false, valid_before: Time.current - 1.hour)
    assert_not invitation.available?
  end


end
