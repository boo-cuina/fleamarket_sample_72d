class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :user, presence: true, foreign_key: true

  with_options presence: true d o
    validates :last_name
    validates :last_name_reading
    validates :first_name
    validates :first_name_reading
    validates :postcode
    validates :prefecture
    validates :city
    validates :block
    validates :phone_number
  end
end
