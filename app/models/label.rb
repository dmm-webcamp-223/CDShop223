class Label < ApplicationRecord
  has_many :packages, dependent: :destroy
  
  validates :label, presence: true, length: { minimum: 1}
  
  
end


