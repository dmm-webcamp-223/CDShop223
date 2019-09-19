class ReceptLog < ApplicationRecord
	belongs_to :user
	has_many :purchase_data_logs, dependent: :destroy
	validates :postal_code, :delivering_adddress, presence: true, on: :create
#	validates :total, presence: true, numericality: {only_integer: true, greater_than: 0}, on: :update
end
