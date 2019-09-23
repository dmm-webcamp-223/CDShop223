class ShipDataLog < ApplicationRecord
	belongs_to :package
	validates :ship_number, :supplier, presence: true
	validates :shiped_number, presence: true, numericality: {only_integer: true, greater_than: 0}, on: :update
	validates :ship_number, numericality: {only_integer: true, greater_than: 0}, on: :create
	 acts_as_paranoid
end
