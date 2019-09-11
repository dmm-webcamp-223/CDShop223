class RemoveDiscStatusFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :disc_status, :boolean
  end
end
