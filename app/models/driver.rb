class Driver < ApplicationRecord
  has_many :reviews
  has_many :riders , :through => :reviews
  belongs_to :user
end
