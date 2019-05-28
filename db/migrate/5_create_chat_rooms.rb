class CreateChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_rooms, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :topic_id
      t.string :topic_create_user_id
      t.string :sender_user_id
      t.timestamps
    end
  end
end
