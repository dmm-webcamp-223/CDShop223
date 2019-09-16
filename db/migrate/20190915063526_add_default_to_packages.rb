class AddDefaultToPackages < ActiveRecord::Migration[5.2]
  def change
    change_column_default :packages, :disc_stock, 0
  end
end
