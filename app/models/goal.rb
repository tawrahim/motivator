class Goal < ActiveRecord::Base
  attr_accessible :content, :days_to_complete_goal, :start_date, :end_date
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validate :custom_validation

  default_scope order: 'goals.created_at DESC'

  def custom_validation
    errors[:base] << "MEEE" if days_to_complete_goal.blank?
  end
end
