class CreateReceptLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :recept_logs do |t|
      t.integer :user_id
      t.integer :postal_code
      t.string :delivering_adddress
      t.integer :total
      t.integer :postage
      t.boolean :delivered_status

      t.timestamps
    end
  end
end
