class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,        null: false
      t.integer :prefectures_id, null: false
      t.string :address_city,    null: false
      t.string :address_line1,   null: false
      t.string :address_line2 
      t.string :phone_number,    null: false
      t.references :order,       foreing_key: true
      t.timestamps
    end
  end
end
