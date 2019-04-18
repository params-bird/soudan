class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :room_created_user_id
      t.integer :reception_user_id


      t.timestamps
    end
  end
end
