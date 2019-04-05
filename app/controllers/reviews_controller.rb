class ReviewsController < ApplicationController
  def new
    @review = Review.new()
    @driver = Driver.find(params[:driver_id])
    @rider = Rider.find(params[:id])
  end

  def create
    r = Review.new(create_update_params)
    d = Driver.find(params[:driver_id])
    if r.save()
      flash[:notice] = "New review for #{d.first} #{d.last}"
      redirect_to rider_path(:id => params[:id], :driver_id => params[:driver_id]) and return
    else
      flash[:warning] = "Error creating Review"
      redirect_to new_review_path(r) and return
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def create_update_params
    params.require(:review).permit(:stars,:description,:driver_id,:rider_id)
  end
end
