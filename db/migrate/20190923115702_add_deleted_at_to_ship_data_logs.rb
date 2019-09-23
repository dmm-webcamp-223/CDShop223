class AddDeletedAtToShipDataLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :ship_data_logs, :deleted_at, :datetime
    add_index :ship_data_logs, :deleted_at
  end
end
