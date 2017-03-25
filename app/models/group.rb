class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups

  has_one :goal, dependent: :destroy

  validates :name, :goal, :users, presence: true

  def open?
    raise "method should be implemented in a sub-class of Group"
  end
end
