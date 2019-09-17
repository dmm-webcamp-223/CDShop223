class Delete < ActiveRecord::Migration[5.2]
  def change
  	drop_table :purchase_data
  end
end
