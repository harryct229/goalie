class Goal < ApplicationRecord
  STATUS_OPTIONS = %w(done in_progress)
  has_many :activities, dependent: :destroy
  validates :deadline, :description, :target, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS}

  scope :active, -> { where(status: "in_progress" ) }
  scope :goal_of,-> (id) { where(owner_id: id) }
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

  def self.lazy_goal(user_id)
    goal_of(user_id).select do |goal|
      goal.percent_of_time < goal.percent_of_quantity
    end
  end
  def percent_of_time
    (deadline.to_f - Time.now.to_f)/(deadline.to_f - created_at.to_f)
  end
  def percent_of_quantity
    (target.to_f - current_quantity.to_f)/target.to_f
  end
end
