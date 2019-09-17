class AddPackageIdToPurchaseDataLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_data_logs, :package_id, :integer
  end
end
