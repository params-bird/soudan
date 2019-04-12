class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.integer :category_id
      t.string :name, null: false
      t.string :introduction, null: false

      t.timestamps
    end
  end
end
