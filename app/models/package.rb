class Package < ApplicationRecord
  belongs_to :label
  belongs_to :genre
  belongs_to :artist

  has_many :order_logs, dependent: :destroy
  has_many :discs, dependent: :destroy
  has_many :ship_data_logs, dependent: :destroy
  has_many :purchase_data_logs, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :disc_image
  acts_as_paranoid
  accepts_nested_attributes_for :discs, allow_destroy: true

  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end