require 'rails_helper'

RSpec.describe Rider, type: :model do
    describe "check attributes and methods" do
        it "should be able to create a new Rider object with the correct methods" do
            u = User.create!(email: "test@tester.edu", password: "password", password_confirmation: "password")
            r = Rider.create!(first: "Test", last: "Person", destination: "Hamilton", user_id: u.id)
            expect(r).to respond_to :first
            expect(r).to respond_to :last
            expect(r).to respond_to :destination
            expect(Rider).to respond_to :filter_on_constraints
        end

        it "should fail to create a new Rider without a User" do
            expect{Rider.create!(first: "Test", last: "Person", destination: "Hamilton")}.to raise_exception ActiveRecord::RecordInvalid
        end
    end

    describe "filter_on_constraints tests" do
        before(:example) do
            u1 = User.create!(email: "test1@tester.edu", password: "password1", password_confirmation: "password1")
            u2 = User.create!(email: "test2@tester.edu", password: "password2", password_confirmation: "password2")
            u3 = User.create!(email: "test3@tester.edu", password: "password3", password_confirmation: "password3")

            Driver.create!(first: "Test", last: "1", seats: 1, price: 10, user_id: u1.id)
            Driver.create!(first: "Test", last: "2", seats: 2, price: 20, user_id: u2.id)
            Driver.create!(first: "Test", last: "3", seats: 3, price: 30, user_id: u3.id)
        end

        it "should filter correctly for seats" do
            drivers = Rider.filter_on_constraints(:minseats => 2)
            expect(drivers.length).to eq(2)
        end

        it "should filter correctly for price" do
            drivers = Rider.filter_on_constraints(:maxprice => 25)
            expect(drivers.length).to eq(2)
        end
    end
end
