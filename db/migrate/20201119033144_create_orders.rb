class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreing_key: true
      t.references :item, foreing_key: true
      t.timestamps
    end
  end
end
