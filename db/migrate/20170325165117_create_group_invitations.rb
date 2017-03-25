class CreateGroupInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :group_invitations do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :inviter_id

      t.timestamps
    end
  end
end
