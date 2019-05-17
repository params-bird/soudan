class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.string :uid
      t.string :provider
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :name, null: false
      t.binary :image_url
      t.timestamps
    end
  end
end
