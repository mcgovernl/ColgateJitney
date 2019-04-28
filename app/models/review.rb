class Review < ApplicationRecord
  belongs_to :riders, :optional => true
  belongs_to :drivers, :optional => true
  belongs_to :rides, :optional => true
end
