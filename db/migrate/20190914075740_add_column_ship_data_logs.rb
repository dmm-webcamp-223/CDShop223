class AddColumnShipDataLogs < ActiveRecord::Migration[5.2]
    def up
      add_column :ship_data_logs, :ship_number, :integer
    end

    def down
      remove_column :ship_data_logs, :ship_number, :integer
    end
end
