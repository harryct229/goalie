class Goal < ApplicationRecord
  STATUS_OPTIONS = %w(done in_progress)
  has_many :activities, dependent: :destroy
  validates :deadline, :description, :target, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS}

  scope :active, -> { where(status: "in_progress" ) }

end
