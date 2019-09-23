class AddTotalPlusPostageFromReceptLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :recept_logs, :total_plus_postage, :integer, default: 0
  end
end
