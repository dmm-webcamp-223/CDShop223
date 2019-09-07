class CreateOrderLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :order_logs do |t|
      t.integer :package_id
      t.integer :order_number

      t.timestamps
    end
  end
end
