class CreateShipAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_adresses do |t|
      t.integer :user_id
      t.string :shipping_add
      t.integer :postal_code

      t.timestamps
    end
  end
end
