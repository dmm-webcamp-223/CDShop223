class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name_kanzi_sei, presence: true
  validates :name_kanzi_mei, presence: true
  validates :name_kana_sei, presence: true
  validates :name_kana_mei, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :recept_logs, dependent: :destroy
  acts_as_paranoid

  composed_of :kanzi_fullname,
  :class_name => "FullName",
  :mapping => [
    [:name_kanzi_sei, :family_name],
    [:name_kanzi_mei, :given_name]
  ]

  composed_of :kana_fullname,
  :class_name => "FullName",
  :mapping => [
    [:name_kana_sei, :family_name],
    [:name_kana_mei, :given_name]
  ]

  def self.search(search)
    if search

      where(["name_kanzi_sei LIKE? OR name_kanzi_mei LIKE? OR name_kana_sei LIKE? OR name_kana_mei LIKE?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      with_deleted

    end
  end

end

#フルネイムメソッド
class FullName
  attr_reader :family_name, :given_name

  def initialize(family_name, given_name)
    @family_name = family_name
    @given_name = given_name
  end

  def to_s
    [@family_name, @given_name].compact.join(" ")
  end

end
