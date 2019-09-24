class AddDeletedAtToReceptLog < ActiveRecord::Migration[5.2]
  def change
    add_column :recept_logs, :deleted_at, :datetime
    add_index :recept_logs, :deleted_at
  end
end
