class AddDefaultToShipDataLogs < ActiveRecord::Migration[5.2]
  def change
    change_column_default :ship_data_logs, :arrival_status, false
  end
end
