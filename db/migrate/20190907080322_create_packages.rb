class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.string :title
      t.text :disc_image
      t.integer :price
      t.integer :disc_stock
      t.boolean :disc_status

      t.timestamps
    end
  end
end
