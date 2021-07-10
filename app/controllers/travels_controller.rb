class TravelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @travels = current_user.travels
  end

  def new
    @travel = current_user.travels.new
  end

  def create
    @travel = current_user.travels.new(travel_params)
    @travel.save!
    redirect_to root_path
  end
  
  def edit 
    @travel = current_user.travels.find(params[:id])
  end
  
  def update
    @travel = current_user.travels.find(params[:id])

    if @travel.update(travel_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy 
    @travel = current_user.travels.find(params[:id])
    @travel.destroy
    @travel.save!
    redirect_to root_path
  end

  private

  def travel_params
    params.require(:travel).permit(:name, :start_date, :end_date)
  end
end

 