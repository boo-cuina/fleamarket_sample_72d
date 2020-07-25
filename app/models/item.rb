class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingfrom

  belongs_to :buyer,  class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id', optional: true


  has_many :photos,dependent: :destroy
  belongs_to :category, optional: true


  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true,  length: { maximum: 1000 }
  validates :size, presence: true
  validates :status, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :shipping_fee, presence: true
  validates :shippingfrom, presence: true
  validates :shipping_days, presence: true
  validates :seller, presence: true
  validates :category, presence: true
  validates :photos, presence: true

end
