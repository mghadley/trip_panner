class AddressesController < ApplicationController
  def index
  	@addresses = Address.all
  end

  def show
  	@location = Location.find(params[:location_id])
  	@address = Address.find(params[:id])
  end

  def new
  	@location = Location.find(params[:location_id])
  	@address = Address.new
  end

  def create
  	@location = Location.find(params[:address][:location_id])
  	@address = @location.addresses.new(address_params)
  	if @address.save
      flash.now[:success] = "Address Added Successfully"
  		redirect_to address_path(id: @address.id, location_id: @location.id)
  	else
      flash.now[:danger] = @address.errors.full_messages.join('<br/>').html_safe
  		render :new
  	end
  end

  def edit
  	@location = Location.find(params[:location_id])
  	@address = Address.find(params[:id])
  end

  def update
    @location = Location.find(params[:address][:location_id])
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to address_path(id: @address.id, location_id: @location.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	Address.find(params[:id]).destroy
  	redirect_to addresses_path
  end

  private

  def address_params
  	params.require(:address).permit(:name, :street, :city, :state, :zip, :location_id)
  end
end