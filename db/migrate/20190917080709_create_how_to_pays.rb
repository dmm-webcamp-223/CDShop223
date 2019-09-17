class CreateHowToPays < ActiveRecord::Migration[5.2]
  def change
    create_table :how_to_pays do |t|
      t.string :how_to_pay

      t.timestamps
    end
  end
end
