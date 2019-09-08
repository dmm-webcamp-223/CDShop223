class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :package
  has_many :carts, dependent: :destoy
end
