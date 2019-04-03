class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.integer :category_id
      t.string :name
      t.string :introduction

      t.timestamps
    end
  end
end
