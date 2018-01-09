class CreateGoalComments < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id
      t.string :body

      t.timestamps
    end
  end
end
