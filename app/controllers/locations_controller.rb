class LocationsController < ApplicationController
  before_action :set_loc, only: %i[show edit update destroy]

  def show
  end

  def index
    @locations = Location.all
    @region = Region.find(params[:region_id])
  end

  def edit
  end

  def new
    @location = Location.new
    @region = Region.find(params[:region_id])
  end

  def create
    @location = Location.new(loc_params)
    if @location.save
      flash[:notice] = "Location added successfully."
      redirect_to @location
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @location.update(loc_params)
      flash[:notice] = "Location updated successfully."
      redirect_to @location
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @region = @location.region
    @location.destroy
    flash[:notice] = "#{@location.location} location deleted successfully."
    redirect_to locations_path(region_id: @region.id)
  end
  private

  def set_loc
    @location = Location.find(params[:id])
  end

  def loc_params
    params.require(:location).permit(:location, :region_id)
  end
end
