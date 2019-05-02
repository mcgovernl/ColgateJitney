class Review < ApplicationRecord
  belongs_to :rider
  belongs_to :driver
  belongs_to :ride
end
