class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password, :last_name, :last_name_reading, :first_name, :first_name_reading, :birthday, presence: true
   
  has_many :items
  has_many :addresses
  has_one :card
end
