class CreateUserChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chat_rooms do |t|
      t.references :chat_room, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
