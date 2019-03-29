class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :introduction

      t.timestamps
    end
  end
end
