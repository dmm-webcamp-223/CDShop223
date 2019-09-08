class PurchaseDataLog < ApplicationRecord
	belongs_to :recept_log
	belongs_to :package
end
