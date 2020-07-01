class Photo < ApplicationRecord
  belongs_to :item, optional: true
end
