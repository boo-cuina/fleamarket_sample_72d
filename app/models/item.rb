class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingfrom

  belongs_to :user
  has_many :photos
  belongs_to :category

  accepts_nested_attributes_for :photos, allow_destroy: true
end
