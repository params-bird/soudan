class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.string :block_user_id
      t.string :sender_user_id
      t.timestamps
    end
  end
end
