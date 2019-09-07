class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_one :cart
   has_many :recept_log, dependent: :destroy
   has_many :ship_adress, dependent: :destroy
end
