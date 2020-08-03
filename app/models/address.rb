class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # validates :user, presence: true

  with_options presence: true do
    validates :last_name
    validates :last_name_reading
    validates :first_name
    validates :first_name_reading
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :block
  end
end
