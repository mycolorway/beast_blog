class InvitationMailer < ApplicationMailer

  def invite_email invitation
    @invitation = invitation

    mail to: invitation.email, subject: ENV['site_name']
  end
end
