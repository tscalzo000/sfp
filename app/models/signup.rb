class Signup < ApplicationRecord
  validates :user_id, presence: true, numericality: true
  validates :game_id, presence: true, numericality: true
  belongs_to :user
  belongs_to :game
end
