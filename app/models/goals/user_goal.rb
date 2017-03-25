class UserGoal < Goal
  belongs_to :owner, class_name: User.name, foreign_key: :owner_id,
    inverse_of: :goals

  validates :owner, presence: true
end
