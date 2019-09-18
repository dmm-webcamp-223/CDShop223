class Package < ApplicationRecord
  belongs_to :label
  belongs_to :genre
  belongs_to :artist

  has_many :order_logs, dependent: :destroy
  has_many :discs, dependent: :destroy
  has_many :ship_data_logs, dependent: :destroy
  has_many :purchase_data_logs, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  attachment :disc_image
  acts_as_paranoid
  accepts_nested_attributes_for :discs, allow_destroy: true

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

end
