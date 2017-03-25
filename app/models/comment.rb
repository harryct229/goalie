class Comment < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :content, presence: true
end
