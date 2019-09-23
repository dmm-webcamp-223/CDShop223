class AddDeletedAtToPurchaseDataLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_data_logs, :deleted_at, :datetime
    add_index :purchase_data_logs, :deleted_at
  end
end
