class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.binary :avater
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
