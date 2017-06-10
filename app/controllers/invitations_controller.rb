class InvitationsController < ApplicationController
  before_action :load_invitation

  def edit
    render layout: 'center'
  end

  def update
    invitation.attributes = invitations_params
    if invitation.ready? && invitation.save
      log_in(invitation.author) if invitation.active
    end
  end

  private

  def load_invitation
    redirect_to root_path unless invitation&.available?
  end

  def invitation
    @invitation ||= Invitation.find_by_code(params[:id])
  end

  def invitations_params
    params.require(:invitation).permit(:password, :name)
  end

end
