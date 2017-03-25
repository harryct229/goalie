class Activity < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
