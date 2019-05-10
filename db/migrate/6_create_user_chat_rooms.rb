class CreateUserChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chat_rooms, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :chat_room_id
      t.string :user_id
      t.timestamps
    end
  end
end
