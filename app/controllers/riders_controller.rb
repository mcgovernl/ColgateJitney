class RidersController < ApplicationController
    def index
        #homepage for rider using the app
        #should show list of avaliable drivers
        #need to redirect to new if there is no rider for current user
        begin
          @user = User.find(current_user[:id])
          @rider = @user.rider
        rescue ActiveRecord::RecordNotFound
          redirect_to new_rider_path and return
        end

        if @rider == nil
          redirect_to new_rider_path and return
        end

        do_redirect, view_prefs = update_settings(params, session)
        if do_redirect
            flash.keep
            redirect_to riders_path(view_prefs) and return
        end

        @drivers = filter_and_sort view_prefs
        # @drivers = Driver.where("available = ?", true)

        @rides = Ride.where("rider_id = ? and done = ?",@rider.id,true)
    end

    def show
      @rider = Rider.find(params[:id])
      @driver = Driver.find(params[:driver_id])
      @reviews = @driver.reviews
      @rides = Ride.where("driver_id = ? AND rider_id = ?",@driver.id,@rider.id)
    end

    def new
        #if no rider associated to a user should go here
        @rider = Rider.new()
    end

    def create
        params[:rider][:user_id] = current_user[:id]
        r = Rider.new(create_update_params)
        r.has_ride = false
        if params[:rider][:first] != ""
            if r.save()
                flash[:notice] = "Successfully created rider #{r.first} #{r.last}"
                redirect_to riders_path(r) and return
            end
        else
            flash[:warning] = "Error creating rider"
            redirect_to new_rider_path(r) and return
        end
    end

    def edit
        #edit rider profile details
        id = params[:id]
        @rider = Rider.find(id)
    end

    def update
        id = params[:id]
        r = Rider.find(id)
        r.update(create_update_params)
        if r.save()
            flash[:notice] = "Successfully updated rider #{r.first} #{r.last}"
            redirect_to riders_path() and return
        else
            flash[:warning] = "Error updating rider"
            redirect_to edit_rider_path() and return
        end
    end

    private
    def create_update_params
        params.require(:rider).permit(:first,:last,:destination,:start,:user_id)
    end

    def update_settings(parms, sess)
        preferences = sess[:preferences] || Hash.new
        if parms[:reset_filters]
            session.clear
            return true, preferences
        end

        should_redirect = false
        {"seats_filter" => "", "price_filter" => ""}.each do |parm, default|
            parmval = parms[parm]
            if parmval.nil?
                parmval = preferences[parm] || default
                should_redirect = true
            elsif parmval != preferences[parm]
                should_redirect = true
            end
            preferences[parm] = parmval
        end

        sess[:preferences] = preferences
        return should_redirect, preferences
    end

    def filter_and_sort(view_prefs)
        constraints = {}
        minseats = view_prefs["seats_filter"].to_i
        if minseats > 0
            constraints[:minseats] = minseats
        end
        maxprice = view_prefs["price_filter"].to_i
        if maxprice > 0
            constraints[:maxprice] = maxprice
        end

        drivers = Rider.filter_on_constraints(constraints)

        return drivers.where("available = ?", true)
    end
end
