# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: 'test@test.com',
  postal_code: '555-5555',
  address: '大阪府難波DMM',
  password: 'aaaaaa',
  name_kanzi_sei: '田中',
  name_kanzi_mei: '太郎',
  name_kana_sei: 'タナカ',
  name_kana_mei: 'タロウ',
  phone_number: '99999999',
  
  )
