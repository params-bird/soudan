class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.integer :block_user_id
      t.integer :sender_user_id
      t.timestamps
    end
  end
end
