class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :items
  has_one :address, dependent: :destroy
  has_one :card

  validates :email, presence: true, uniqueness: true

  with_options presence: true do
    validates :nickname
    validates :password
    validates :last_name, format: {with: /\A[一-龥ぁ-ん]/}
    validates :last_name_reading, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name, format: {with: /\A[一-龥ぁ-ん]/}
    validates :first_name_reading, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
