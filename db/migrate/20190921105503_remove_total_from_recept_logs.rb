class RemoveTotalFromReceptLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :recept_logs, :total, :integer
  end
end
