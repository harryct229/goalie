require 'pry'
class Goal < ApplicationRecord
  STATUS_OPTIONS = %w(done in_progress)
  has_many :activities, dependent: :destroy
  validates :deadline, :description, :target, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS}

  scope :active, -> { where(status: "in_progress" ) }

  # add statemachine
  state_machine :status, :initial => :in_progress do
    event :finish do
      transition :in_progress => :done
    end
  end
  def recompute_current_quantity!
    self.current_quantity = 0
    activities.each do |activity|
    	self.current_quantity += activity.quantity
    end
    self.save!
  end
end
