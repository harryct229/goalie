class GroupGoal < Goal
  belongs_to :owner, class_name: Group.name, foreign_key: :owner_id

  validates :owner, presence: true
end