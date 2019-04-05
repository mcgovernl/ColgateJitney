class DriversController < ApplicationController

    def show
        #homepage for driver using the app. Shows their Driver information
        #should also allow them to edit their avliablity on the fly
        #need to redirect to new if no driver for current user
        id = current_user[:id]
        begin
          @driver = Driver.find(id)
        rescue ActiveRecord::RecordNotFound
          redirect_to new_driver_path() and return
        end
        @reviews = @driver.reviews
    end

    def new
        #if username and password are not connected to a driver this page should load
        @driver = Driver.new()
    end

    def create
        d = Driver.new(create_update_params)
        if d.save()
            flash[:notice] = "Successfully created driver #{d.first} , #{d.last}"
            redirect_to driver_path(d) and return
        else
            flash[:warning] = "Error creating driver"
            redirect_to new_rider_path(d) and return
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
        d.update(create_update_params)
        if d.save()
            flash[:notice] = "Successfully updated driver #{d.first} , #{d.last}"
            redirect_to driver_path(d) and return
        else
            flash[:warning] = "Error updating driver"
            redirect_to edit_rider_path(d) and return
        end
    end

    def destroy
    end

    private
    def create_update_params
        params.require(:driver).permit(:first,:last,:make,:model,:plate,:seats,:available)
    end
end
