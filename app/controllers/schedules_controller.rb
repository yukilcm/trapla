class SchedulesController < ApplicationController
  def index
    @travels,@schedule = current_user.schedules
  end
  
  def new
    @travel,@schedule = current_user.schedules.new
  end
  
  def create
    @schedules = current_user.schedules.new(schedule_params)
    @schedules.save!
    redirect_to travels/:id/schedules_path
  end  
  
  private

  def schedule_params
    params.require(:schedules).permit(:start_at, :end_at)
  end
end
