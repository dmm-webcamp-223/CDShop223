class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  acts_as_paranoid
  def self.serch(search)
  	return User.all unless search
  	User.where(['name_kanzi_sei LIKE ?',])
  end
end
