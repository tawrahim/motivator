class Status < ActiveRecord::Base
  attr_accessible :milestone, :goal_id
  belongs_to :goal
  validates :milestone, presence: true
end
