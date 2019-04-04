class DriversController < ApplicationController
    def new
        @driver = Driver.new
    end

    def create
    end
end
