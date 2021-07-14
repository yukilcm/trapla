class SchedulesController < ApplicationController
  def index
    @schedules = current_user.travels.find(params[:travel_id])
  end
  
  def new
    @schedule = current_user.travels.find(params[:travel_id]).new
  end
  
  def create
    @schedule = current_user.travels.find(params[:travel_id]).schedules.new(schedule_params)
    @schedule.save!
    redirect_to travel_schedules_path
  end  
  
  def edit 
    @schedule = current_user.travels.find(params[:travel_id]).schedules
  end
  
  def update
    @schedule = current_user.travels.find(params[:travel_id]).schedules

    if @schedule.update(travel_params)
      redirect_to travel_schedules_path
    else
      render :edit
    end
  end
  
  def destroy 
    @schedule = current_user.travels.find(params[:travel_id]).schedules
    @schedule.destroy
    @schedule.save!
    redirect_to travel_schedules_path
  end

  
  private

  def schedule_params
    params.require(:schedules).permit(:start_at, :end_at)
  end
end
