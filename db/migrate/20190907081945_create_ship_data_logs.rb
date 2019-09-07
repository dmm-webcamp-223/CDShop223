class CreateShipDataLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_data_logs do |t|
      t.integer :package_id
      t.string :ship_date
      t.integer :shiped_number
      t.string :supplier
      t.boolean :arrival_status

      t.timestamps
    end
  end
end
