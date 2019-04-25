class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :text
      t.timestamps
    end
  end
end
