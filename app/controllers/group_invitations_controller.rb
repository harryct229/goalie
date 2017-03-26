class GroupInvitationsController < ApplicationController
  def confirm
    @group_invitation = GroupInvitation.find(params[:id])
    @group_invitation.confirm!
    redirect_to goal_path(@group_invitation.group.goal)
  end
end
