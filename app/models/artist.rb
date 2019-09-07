class Artist < ApplicationRecord
  has_many :packages, dependent: :destroy
end

