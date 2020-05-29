class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :update, :edit, :destroy]

  def index
    @gyms = Gym.all
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def edit
  end

  def create
    @gym = Gym.new(gym_params)
    
    if @gym.save 
      redirect_to gyms_path 
    else
      render :new 
    end
  end

  def update 
    if @gym.update(gym_params)
      redirect_to @gym
    else
      render :edit   
    end
  end

  def destroy
    @gym.destroy
    redirect_to gyms_path
  end

  private 
    def set_gym
      @gym = Gym.find(params[:id])
    end

  def gym_params
    params.require(:gym).permit(:name)
  end
end
