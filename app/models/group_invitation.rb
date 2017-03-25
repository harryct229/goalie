class GroupInvitation < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :inviter, class_name: User.name, foreign_key: :inviter_id

  def send_invitation
    InvitationMailer.group_invitation(self.id).deliver
  end

  def confirm!
    group.user_groups.create! user: user
  end
end
