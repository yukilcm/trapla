class SchedulesController < ApplicationController
  def index
    travel = current_user.travels.find(params[:travel_id])
    @schedules = travel.schedules
  end
  
  def new
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.new
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
    params.require(:schedule).permit(:start_at, :end_at, :title, :memo, :cost)
  end
end
