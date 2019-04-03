class CreateFuns < ActiveRecord::Migration[5.1]
  def change
    create_table :funs do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  add_index :funs, :follower_id, unique: true
  add_index :funs, :followed_id, unique: true

  end
end
