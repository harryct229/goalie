class GroupGoal < Goal
  belongs_to :owner, class_name: Group.name, foreign_key: :owner_id,
    inverse_of: :goal

  validates :owner, presence: true
end