class CreateFuns < ActiveRecord::Migration[5.1]
  def change
    create_table :funs do |t|
      t.integer :user_id
      t.integer :campany_id

      t.timestamps
    end
  end
end
