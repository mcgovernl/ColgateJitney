class Rider < ApplicationRecord
  has_many :reviews
  has_many :drivers , :through => :reviews
  belongs_to :user
end
