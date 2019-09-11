class AddDiscStatusToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :disc_status, :boolean, default: false, null: false
  end
end
