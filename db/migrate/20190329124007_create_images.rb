class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.binary :image
      t.integer :post_id

      t.timestamps
    end
  end
end
