class CreateUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
