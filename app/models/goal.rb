class Goal < ApplicationRecord
  has_many :activities, dependent: :destroy

  validates :deadline, :description, :target, presence: true
end
