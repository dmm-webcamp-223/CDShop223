class RenameKasaColumnToAdmins < ActiveRecord::Migration[5.2]
  def change
  	rename_column :admins, :name_kasa_sei, :name_kana_sei
  end
end
