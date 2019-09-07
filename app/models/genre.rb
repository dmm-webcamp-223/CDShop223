class Genre < ApplicationRecord
  has_many :packages, dependent: :destroy
end
