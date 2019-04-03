class CreateCampanies < ActiveRecord::Migration[5.1]
  def change
    create_table :campanies do |t|
      t.integer :user_id
      t.string :staff_last_name_kana
      t.string :staff_first_name_kana
      t.string :campany_url
      t.bigint :tel
      t.binary :campany_logo

      t.timestamps
    end
  end
end