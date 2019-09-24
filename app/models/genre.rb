class Genre < ApplicationRecord
  has_many :packages, dependent: :destroy
  validates :category,  presence: true
end
