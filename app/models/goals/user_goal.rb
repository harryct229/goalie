class UserGoal < Goal
  belongs_to :owner, class_name: User.name, foreign_key: :owner_id

  validates :owner, presence: true
end