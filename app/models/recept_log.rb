class ReceptLog < ApplicationRecord
	blongs_to :user
	has_many :purchase_data_logs, dependent: :destroy
end
