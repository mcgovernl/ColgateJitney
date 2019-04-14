class RidersController < ApplicationController
    def index
        #homepage for rider using the app
        #should show list of avaliable drivers
        #need to redirect to new if there is no rider for current user
        # byebug
        begin
          @rider = Rider.find(current_user[:id])
        rescue ActiveRecord::RecordNotFound
          redirect_to new_rider_path and return
        end
        @drivers = Driver.where("available = ?", true)
    end

    def show
      @driver = Driver.find(params[:driver_id])
      @reviews = @driver.reviews
    end

    def new
        #if no rider associated to a user should go here
        @rider = Rider.new()
    end

    def create
        r = Rider.new(create_update_params)
        if params[:rider][:first] != ""
            if r.save()
                flash[:notice] = "Successfully created rider #{r.first} , #{r.last}"
                redirect_to riders_path(r) and return
            end
        else
            flash[:warning] = "Error creating rider"
            redirect_to new_rider_path(r) and return
        end
    end

    # def edit
    #     #edit rider profile details
    #     id = params[:id]
    #     @rider = Rider.find(id)
    # end
    #
    # def update
    #     id = params[:id]
    #     r = Rider.find(id)
    #     r.update(create_update_params)
    #     if r.save()
    #         flash[:notice] = "Successfully updated rider #{r.first} , #{r.last}"
    #         redirect_to riders_path(r) and return
    #     else
    #         flash[:warning] = "Error updating rider"
    #         redirect_to edit_rider_path(r) and return
    #     end
    # end

    def destroy
    end

    private
    def create_update_params
        params.require(:rider).permit(:first,:last,:destination)
    end
end
