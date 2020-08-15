class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # validates :user, presence: true

  with_options presence: true do
    validates :last_name, format: {with: /\A[一-龥ぁ-ん]/}
    validates :last_name_reading, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name, format: {with: /\A[一-龥ぁ-ん]/}
    validates :first_name_reading, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :postcode, format: {with: /\A\d{3}-\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :block
  end
end
