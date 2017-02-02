class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :playernum, presence: true
  validates :playernum, numericality: { message: 'You must enter an integer' }
  validates :dm_id, presence: true, numericality: true
  validates :gametype, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :day, presence: true
  validates :day, inclusion: { in: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] }
  validates :frequency, presence: true
  has_many :signups
  has_many :users, through: :signups
  has_many :comments
  has_many :requests
  has_many :notes
end
