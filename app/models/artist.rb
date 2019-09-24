class Artist < ApplicationRecord
	validates :artist, presence: true, length: { minimum: 1 }
	has_many :packages, dependent: :destroy
end
