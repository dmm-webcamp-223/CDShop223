class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :package
  validates :quantity, numericality: {greater_than: 0}
end
