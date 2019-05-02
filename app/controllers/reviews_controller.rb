class ReviewsController < ApplicationController
    def new
        @review = Review.new()
        @driver = Driver.find(params[:driver_id])
        @rider = Rider.find(params[:rider_id])
        @ride = Ride.find(params[:ride_id])
    end

    def create
        rev = Review.new(create_update_params)
        d = Driver.find(params[:review][:driver_id])
        ride = Ride.where("driver_id = ? AND rider_id = ? AND reviewed = ?",d.id,params[:review][:rider_id],false)
        ride = ride[0]
        if params[:review][:stars] != ""
            ride.reviewed = true
            if rev.save()
                if ride.save()
                    flash[:notice] = "New review for #{d.first} #{d.last}"
                    redirect_to rider_path(:id => params[:review][:rider_id], :driver_id => params[:review][:driver_id]) and return
                end
            end
        end
        flash[:warning] = "Error creating Review"
        redirect_to new_review_path(:rider_id => params[:review][:rider_id], :driver_id => params[:review][:driver_id], :ride_id => params[:review][:ride_id]) and return
    end

    # def edit
    # end
    #
    # def update
    # end
    #
    # def destroy
    # end

    private
    def create_update_params
        params.require(:review).permit(:stars,:description,:driver_id,:rider_id,:ride_id)
    end
end
