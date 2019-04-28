class RidesController < ApplicationController
  def create
      @rider = Rider.find(params[:rider_id])
      @dirver = Driver.find(params[:driver_id])
      params[:start] = @rider.start
      params[:destination] = @rider.destination
      @ride = Ride.new(create_update_params)
      if @ride.save
          @driver.avaliable = false
          if @driver.save
            flash[:notice] = "Successfully booked ride with #{driver.first} #{driver.last}"
            redirect_to rider_path(:id => rider.id,:driver_id => driver.id) and return
          end
      end
      flash[:warning] = "Failed to book ride"
      redirect_to rider_path(:id => rider.id,:driver_id => driver.id) and return
  end

    private
    def create_update_params
      @params.require(:rider_id,:driver_id).permit(:start,:destination)
    end
end
