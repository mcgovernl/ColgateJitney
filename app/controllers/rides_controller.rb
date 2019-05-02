class RidesController < ApplicationController
  def create
      @rider = Rider.find(params[:booking][:rider_id])
      @driver = Driver.find(params[:booking][:driver_id])
      params[:booking][:start] = @rider.start
      params[:booking][:destination] = @rider.destination
      params[:booking][:reviewed] = false
      @ride = Ride.new(create_update_params)
      @ride.done = false
      if @driver.available #just to check if someone has booked a ride with the driver since you last update the page
        if @ride.save
            @driver.available = false
            @rider.has_ride = true
            if @driver.save
              if @rider.save
                flash[:notice] = "Successfully booked ride with #{@driver.first} #{@driver.last}"
                redirect_to riders_path() and return
              end
            end
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
          @rider.has_ride = false
          if @driver.save
            if @rider.save
              flash[:notice] = "Successfully completed ride with #{@rider.first} #{@rider.last}"
              redirect_to driver_path(:driver_id => @driver.id) and return
            end
          end
      end
      flash[:warning] = "Failed to complete ride"
      redirect_to driver_path(:driver_id => @driver.id) and return
  end

private
  def create_update_params
    params.require(:booking).permit(:driver_id,:rider_id,:start,:destination,:reviewed)
  end
end
