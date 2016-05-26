class LocationsController < ApplicationController
  def index
  	@trip = Trip.find(params[:trip_id])
    @locations = Location.all
  end

  def show
    # @trip = Trip.find(params[:trip_id])
    @location = Location.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
  	@location = Location.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.new(location_params)
  	if @location.save
  		redirect_to trip_location_path(id: @location.id)
  	else
  		render :new
  	end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @location = Location.find(params[:id])
  end

  def update
  	@location = Location.find(params[:id])
  	if @location.update(location_params)
  		redirect_to trip_location_path(@location.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	Location.find(params[:id]).destroy
  	redirect_to trip_locations_path
  end

  private

  def location_params
  	params.require(:location).permit(:city, :country, :description, :trip_id)
  end
end