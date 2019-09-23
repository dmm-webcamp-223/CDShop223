class AddWeekFromPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :week, :integer, default: 0
  end
end
