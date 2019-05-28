class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :user_id
      t.string :title, null: false
      t.integer :category_id, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
