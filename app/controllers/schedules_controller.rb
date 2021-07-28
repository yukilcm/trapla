class SchedulesController < ApplicationController
  before_action :authenticate_user!
  def index
    @travel = current_user.travels.find(params[:travel_id])
    @schedules = @travel.schedules
  end
  
  def new
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.build
  end
  
  def create
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.build(schedule_params)
    @schedule.save!
    redirect_to travel_schedules_path
  end  
  
  def edit 
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.find(params[:id])
  end
  
  def update
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to travel_schedules_path
    else
      render :edit
    end
  end
  
  def destroy 
    @travel = current_user.travels.find(params[:travel_id])
    @travel.schedules.find(params[:id]).destroy
    redirect_to travel_schedules_path
  end

  
  private

  def schedule_params
    params.require(:schedule).permit(:start_at, :end_at, :title, :memo, :cost)
  end
end
