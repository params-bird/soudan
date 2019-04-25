class CreateChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_rooms do |t|
      t.references :topic, foreign_key: true
      t.integer :topic_create_user_id
      t.integer :sender_user_id
      t.timestamps
    end
  end
end
