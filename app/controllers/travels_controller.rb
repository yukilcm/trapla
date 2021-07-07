class TravelsController < ApplicationController
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

  private

  def travel_params
    params.require(:travel).permit(:name, :start_date, :end_date)
  end
end
