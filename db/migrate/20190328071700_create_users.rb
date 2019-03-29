class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.binary :avater
      t.integer :category_id

      t.timestamps
    end
  end
end
