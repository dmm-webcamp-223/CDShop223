class RenameKasaToName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :name_kasa_sei, :name_kana_sei
  end
end
