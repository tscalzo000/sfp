class Charactersheet < ApplicationRecord
  belongs_to :user
  has_many :charviews
end
