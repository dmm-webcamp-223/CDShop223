class Disc < ApplicationRecord
	belongs_to :package
	has_many :song
end