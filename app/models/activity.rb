class Activity < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  has_many :comments

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
