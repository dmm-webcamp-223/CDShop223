class AddColumnPackageIdtoReview < ActiveRecord::Migration[5.2]
  def up
  	add_column :reviews, :package_id, :string
  end
end
