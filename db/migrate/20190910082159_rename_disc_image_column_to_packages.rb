class RenameDiscImageColumnToPackages < ActiveRecord::Migration[5.2]
  def change
    rename_column :packages, :disc_image, :disc_image_id
  end
end
