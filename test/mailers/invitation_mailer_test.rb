require 'test_helper'

class InvitationMailerTest < ActionMailer::TestCase
  attr_reader :email, :invitation, :author_name, :mail_path

  def setup
    @email = "steve.jobs@apple.com"
    @author_name = "Steve Jobs"
    @invitation = Invitation.create(email: @email, name: @author_name)
    @mail_path = "/invitations/#{@invitation.code}/edit"
  end

  test "invite" do
    mail = InvitationMailer.invite_email invitation

    assert_emails 1 do
      mail.deliver_now
    end

    assert_equal [email], mail.to
    assert mail.text_part.body.to_s.include?(mail_path)
    assert mail.html_part.body.to_s.include?(mail_path)
  end

end
