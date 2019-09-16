class RemoveDefaultFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :default, :string
  end
end
