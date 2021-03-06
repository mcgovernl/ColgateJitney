class DriversController < ApplicationController

    def show
        #homepage for driver using the app. Shows their Driver information
        #should also allow them to edit their avliablity on the fly
        #need to redirect to new if no driver for current user
        begin
          @user = User.find(current_user[:id])
          @driver = @user.driver
        rescue ActiveRecord::RecordNotFound
          redirect_to new_driver_path and return
        end
        if @driver == nil
          redirect_to new_driver_path and return
        end

        @reviews = @driver.reviews
        begin
          @ride = Ride.where("driver_id = ? AND done = ?",@driver.id,false)
          @ride=@ride[0]
          if @ride
            @has_ride = true
            @rider = @ride.rider
          else
            @has_ride = false
          end
        rescue ActiveRecord::RecordNotFound
          @has_ride = false
        end

        @rides = Ride.where("driver_id = ? and done = ?",@driver.id,true)
    end

    def new
        #if username and password are not connected to a driver this page should load
        @driver = Driver.new()
    end

    def create
        params[:driver][:user_id] = current_user[:id]
        d = Driver.new(create_update_params)
        if params[:driver][:first] != ""
          if d.save()
              flash[:notice] = "Successfully created driver #{d.first} #{d.last}"
              redirect_to driver_path(d) and return
          end
        else
            flash[:warning] = "Error creating driver"
            redirect_to new_driver_path(d) and return
        end
    end

    def edit
        #edit driver details
        id = params[:id]
        @driver = Driver.find(id)
    end

    def update
        id = params[:id]
        d = Driver.find(id)
        if params[:toggle]
          d.update(:available => !d.available)
          if d.save()
              flash[:notice] = "Successfully updated driver #{d.first} #{d.last}"
              redirect_to driver_path(d) and return
          else
              flash[:warning] = "Error toggling availability"
              redirect_to driver_path(d) and return
          end
        end

        if !params[:driver].nil? && params[:driver][:first] != ""
            d.update(create_update_params)
            if d.save()
                flash[:notice] = "Successfully updated driver #{d.first} #{d.last}"
                redirect_to driver_path(d) and return
            end
        else
            flash[:warning] = "Error updating driver"
            redirect_to edit_driver_path(d) and return
        end
    end

    private
    def create_update_params
        params.require(:driver).permit(:first,:last,:make,:model,:plate,:seats,:available,:price,:user_id)
    end
end
