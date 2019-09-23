class PurchaseDataLog < ApplicationRecord
	belongs_to :recept_log, -> {with_deleted}

	belongs_to :package, -> {with_deleted}

    acts_as_paranoid

  scope :week, -> { where("created_at > ?",Time.zone.now-1.week) }
end
