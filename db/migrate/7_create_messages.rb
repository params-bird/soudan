class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.references :chat_room, type: :string, foreign_key: true
      t.references :user, type: :string, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
