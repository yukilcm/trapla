class SchedulesController < ApplicationController
  def index
    @schedules = current_user.travels.find(params[:travel_id])
  end
  
  def new
    @schedules = current_user.travels.new
  end
  
  def create
    @schedules = current_user.travels.new(travel_params)
    @schedules.save!
    redirect_to travels/:id/schedules_path
  end  
  
  private

  def schedule_params
    params.require(:schedules).permit(:start_at, :end_at)
  end
end
