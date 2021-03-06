class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups

  has_many :goals, class_name: UserGoal.name, foreign_key: :owner_id,
    dependent: :destroy, inverse_of: :owner
  has_many :comments
  has_many :activities

  validates :fullname, presence: true
  def owner_name
    self.fullname
  end
end
