class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :campany_id
      t.text :offer_massege

      t.timestamps
    end
  end
end
