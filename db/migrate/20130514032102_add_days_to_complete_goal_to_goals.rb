class AddDaysToCompleteGoalToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :days_to_complete_goal, :integer
  end
end
