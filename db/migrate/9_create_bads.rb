class CreateBads < ActiveRecord::Migration[5.1]
  def change
    create_table :bads do |t|
      t.references :user, type: :string, foreign_key: true
      t.string :message_id
      t.timestamps
    end
  end
end
