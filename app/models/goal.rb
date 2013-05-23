class Goal < ActiveRecord::Base
  attr_accessible :content, :days_to_complete_goal, :start_date, :end_date
  belongs_to :user
  has_many  :statuses, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true
  validate :custom_validation

  default_scope order: 'goals.created_at DESC'

  def custom_validation
    errors[:base] << "MEEE" if days_to_complete_goal.blank? 
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id" 
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          { user_id: user.id}) 
  end
end
