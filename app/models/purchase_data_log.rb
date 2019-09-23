class PurchaseDataLog < ApplicationRecord
	belongs_to :recept_log
	belongs_to :package
  
 #   scope :week, -> { where("created_at < ?",TIme.zone.now-1.weeks.ago) }
  scope :week, -> { where("created_at > ?",Time.zone.now-1.week) }
end
