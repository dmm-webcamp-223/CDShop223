class Label < ApplicationRecord
  has_many :packages, dependent: :destroy
end


