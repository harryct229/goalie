class Group < ApplicationRecord
  has_one :goal, class_name: GroupGoal.name, foreign_key: :owner_id,
    dependent: :destroy

  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups

  validates :name, presence: true

  def open?
    raise "method should be implemented in a sub-class of Group"
  end
end
