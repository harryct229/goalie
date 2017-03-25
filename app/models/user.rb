class User < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups

  has_many :goals, class_name: UserGoal.name, foreign_key: :owner_id,
    dependent: :destroy
  has_many :comments
  has_many :activities

  validates :fullname, presence: true
end
