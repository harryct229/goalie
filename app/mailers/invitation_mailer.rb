class InvitationMailer < ActionMailer::Base
  default from: "admin@goalie.com"

  def group_invitation group_invitation_id
    @group_invitation = GroupInvitation.find(group_invitation_id)
    @group = @group_invitation.group
    @user = @group_invitation.user
    @inviter = @group_invitation.inviter

    to = @user.email
    subject = "Invitation: Group #{@group.name}"

    mail(to: to, subject: subject)
  end
end