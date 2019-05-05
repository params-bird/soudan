class CreateUserChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chat_rooms, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.references :chat_room, type: :string, foreign_key: true
      t.string :user_id
      t.timestamps
    end
  end
end
