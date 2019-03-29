class CreateMasseges < ActiveRecord::Migration[5.1]
  def change
    create_table :masseges do |t|
      t.integer :user_id
      t.integer :campany_id
      t.text :massege

      t.timestamps
    end
  end
end
