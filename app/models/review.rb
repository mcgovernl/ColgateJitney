class Review < ApplicationRecord
  belongs_to :riders, :optional => true #might need to be singular
  belongs_to :drivers, :optional => true #might need to be singular
  belongs_to :rides, :optional => true
end
