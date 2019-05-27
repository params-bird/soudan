class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :chat_room_id
      t.string :user_id
      t.text :content, null: false
      t.string :receive_user_id
      t.string :receive_user_id_checked_message
      t.timestamps
    end
  end
end
