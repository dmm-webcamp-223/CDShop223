class ReceptLog < ApplicationRecord
	belongs_to :user
	has_many :purchase_data_logs, dependent: :destroy
end
