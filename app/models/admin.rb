class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name_kanzi_sei,
  length: { minimum: 1, maximum: 6}
  
  validates :name_kanzi_mei,
  length: { minimum: 1, maximum: 6}
  
  validates :name_kana_sei,
  length: { minimum: 1, maximum: 13}
  
  validates :name_kana_mei,
  length: {minimum: 1, maximum: 15}
end
