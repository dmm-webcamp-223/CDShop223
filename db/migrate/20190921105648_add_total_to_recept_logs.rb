class AddTotalToReceptLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :recept_logs, :total, :integer, default: 0
  end
end
