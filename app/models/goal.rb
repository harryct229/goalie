class Goal < ApplicationRecord
  has_many :activities

  validates :deadline, :description, :target, presence: true
end
