class Item < ApplicationRecord
  belongs_to :user
  has_many :photos
  belongs_to :category
end
