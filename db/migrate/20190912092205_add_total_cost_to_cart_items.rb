class AddTotalCostToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :total_cost, :integer, default: 0
  end
end
