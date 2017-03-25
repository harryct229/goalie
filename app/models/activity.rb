class Activity < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  has_many :comments

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  after_save :recompute_current_quantity

  def recompute_current_quantity
    goal.recompute_current_quantity!
  end
end
