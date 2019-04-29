class RidesController < ApplicationController
  def create
      @rider = Rider.find(params[:booking][:rider_id])
      @driver = Driver.find(params[:booking][:driver_id])
      params[:start] = @rider.start #aren't working properly
      params[:destination] = @rider.destination #aren't working properly
      @ride = Ride.new(create_update_params)
      @ride.done = false
      if @ride.save
          @driver.available = false
          if @driver.save
            flash[:notice] = "Successfully booked ride with #{@driver.first} #{@driver.last}"
            redirect_to rider_path(:id => @rider.id,:driver_id => @driver.id) and return
          end
      end
      flash[:warning] = "Failed to book ride"
      redirect_to rider_path(:id => @rider.id,:driver_id => @driver.id) and return
  end

  def update
      @ride = Ride.find(params[:id])
      @driver = @ride.driver
      @rider = @ride.rider
      @ride.done = true
      if @ride.save
          @driver.available = true
          if @driver.save
            flash[:notice] = "Successfully completed ride with #{@rider.first} #{@rider.last}"
            redirect_to driver_path(:driver_id => @driver.id) and return
          end
      end
      flash[:warning] = "Failed to complete ride"
      redirect_to driver_path(:driver_id => @driver.id) and return
  end

private
  def create_update_params
    params.require(:booking).permit(:driver_id,:rider_id,:start,:destination)
  end
end
