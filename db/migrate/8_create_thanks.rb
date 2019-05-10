class CreateThanks < ActiveRecord::Migration[5.1]
  def change
    create_table :thanks do |t|
      t.string :user_id
      t.string :message_id
      t.timestamps
    end
  end
end
