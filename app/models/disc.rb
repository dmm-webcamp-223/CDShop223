class Disc < ApplicationRecord
	belongs_to :package
	has_many :songs, dependent: :destroy
end