class CreatePurchaseDataLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_data_logs do |t|
      t.integer :recept_log_id
      t.integer :purchase_price
      t.integer :tax
      t.integer :numbers

      t.timestamps
    end
  end
end
