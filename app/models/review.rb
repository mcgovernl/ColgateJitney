class Review < ApplicationRecord
  belongs_to :riders
  belongs_to :drivers
end
