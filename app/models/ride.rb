class Ride < ApplicationRecord
  belongs_to :driver
  belongs_to :rider
  has_one :review
end
