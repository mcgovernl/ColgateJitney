class Driver < ApplicationRecord
  has_many :reviews
  has_many :riders , :through => :reviews
  has_many :rides
  belongs_to :user
end
