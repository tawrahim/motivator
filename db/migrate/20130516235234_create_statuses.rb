class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :milestone
      t.integer :goal_id

      t.timestamps
    end
    add_index :statuses, [:goal_id, :created_at]
  end
end
