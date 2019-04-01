class CreateCampanies < ActiveRecord::Migration[5.1]
  def change
    create_table :campanies do |t|
      t.string :name
      t.binary :campany_logo
      t.integer :category_id
      t.string :campany_url
      t.string :email
      t.bigint :tel
      t.string :staff_last_name_kana
      t.string :staff_first_name_kana

      t.timestamps
    end
  end
end