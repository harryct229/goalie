class GroupInvitationsController < ApplicationController
  def confirm
    @group_invitation = GroupInvitation.find(params[:id])
    @group_invitation.confirm!
    redirect_to root_url
  end
end
