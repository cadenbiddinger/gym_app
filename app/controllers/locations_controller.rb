class LocationsController < ApplicationController
  before_action :set_gym
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = @gym.locations
  end

  def show
  end

  def new
    @location = @gym.locations.new
  end

  def edit
  end

  def create
    @location = @gym.locations.new(location_params)

    if @location.save
      redirect_to [@gym, @location]
    else  
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to [@gym, @location]
    else  
      render :edit 
    end
  end

  def destroy
    @location.destroy
    redirect_to gym_locations_path
  end

  private
    def set_gym 
      @gym = Gym.find(params[:gym_id])
    end

    def set_location
      @location = Location.find(params[:id])
    end  

    def location_params
      params.require(:location).permit(:name)
    end
end
