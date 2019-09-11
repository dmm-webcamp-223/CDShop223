class AddColumnToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name_kanzi_sei, :string
    add_column :admins, :name_kanzi_mei, :string
    add_column :admins, :name_kana_sei, :string
    add_column :admins, :name_kana_mei, :string
  end
end
