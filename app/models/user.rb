class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :signups
  has_many :games, through: :signups
end
