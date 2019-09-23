class Song < ApplicationRecord
	belongs_to :disc
	 acts_as_paranoid
end
