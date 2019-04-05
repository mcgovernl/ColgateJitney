class ReviewsController < ApplicationController
  def new
    @review = Review.new()
    @driver = Driver.find(params[:driver_id])
    @rider = Rider.find(params[:rider_id])
  end

  def create
    r = Review.new(create_update_params)
    d = Driver.find(params[:review][:driver_id])
    byebug
    if r.save!()
      flash[:notice] = "New review for #{d.first} #{d.last}"
      redirect_to rider_path(:id => params[:review][:rider_id], :driver_id => params[:review][:driver_id]) and return
    else
      flash[:warning] = "Error creating Review"
      redirect_to new_review_path(:id => params[:review][:rider_id], :driver_id => params[:review][:driver_id]) and return
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
