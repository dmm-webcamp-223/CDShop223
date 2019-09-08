class Package < ApplicationRecord
  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  
  has_many :order_logs, dependent: :destroy
  has_many :discs, dependent: :destroy
  has_many :ship_data_logs, dependent: :destroy
  has_many :purchase_data_logs, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  acts_as_paranoid
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
end
