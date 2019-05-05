class CreateCloses < ActiveRecord::Migration[5.1]
  def change
    create_table :closes do |t|
      t.string :topic_id
      t.timestamps
    end
  end
end
