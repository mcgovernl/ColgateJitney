class Review < ApplicationRecord
  belongs_to :riders, :optional => true
  belongs_to :drivers, :optional => true
end
