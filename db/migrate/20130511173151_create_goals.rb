class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
    add_index :goals, [:user_id, :created_at]
  end
end
