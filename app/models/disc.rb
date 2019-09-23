class Disc < ApplicationRecord
	belongs_to :package
	has_many :songs, dependent: :destroy
    accepts_nested_attributes_for :songs, allow_destroy: true
		  acts_as_paranoid
end
