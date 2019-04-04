class Driver < ApplicationRecord
  has_many :reviews
  has_many :riders , :through => :reviews
end
