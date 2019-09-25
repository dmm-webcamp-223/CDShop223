class AddFavoriteNumToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :favorite_num, :integer, default: 0
  end
end
