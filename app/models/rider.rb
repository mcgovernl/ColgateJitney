class Rider < ApplicationRecord
    has_many :reviews
    has_many :drivers , :through => :reviews
    has_many :rides
    belongs_to :user

    def self.filter_on_constraints(constraint_hash)
        drivers = Driver.all
        constraint_hash.each_pair do |key, value|
            if key == :minseats
                drivers = drivers.where("seats >= ?", value)
            elsif key == :maxprice
                drivers = drivers.where("price <= ?", value)
            end
        end
        return drivers
    end
end
