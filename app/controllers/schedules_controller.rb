class SchedulesController < ApplicationController
  before_action :authenticate_user!
  def index
    @travel = current_user.travels.find(params[:travel_id])
    @schedules = @travel.schedules.order(:start_at)

    @schedule_hash = {}
    (@travel.start_date..@travel.end_date).each do |date|
      @schedule_hash[date] = []
    end
    @schedules.each do |schedule|
      @schedule_hash[schedule.start_at.to_date] << schedule
    end
  end

  def new
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.new
  end

  def create
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.new(schedule_params)
    if @schedule.within_travel_period?
      @schedule.save!
      flash[:success] = 'スケジュールを作成しました'
      redirect_to travel_schedules_path(@travel)
    else
      flash.now[:danger] = 'プランの期間外です'
      render :new
    end
  end

  def edit
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.find(params[:id])
  end

  def update
    @travel = current_user.travels.find(params[:travel_id])
    @schedule = @travel.schedules.find(params[:id])
    @schedule.assign_attributes(schedule_params)
    if @schedule.within_travel_period?
      @schedule.save!
      flash[:success] = 'スケジュールを更新しました'
      redirect_to travel_schedules_path(@travel)
    else
      flash.now[:danger] = 'プランの期間外です'
      render :edit
    end
  end

  def destroy
    @travel = current_user.travels.find(params[:travel_id])
    @travel.schedules.find(params[:id]).destroy
    redirect_to travel_schedules_path(@travel)
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_at, :end_at, :title, :memo, :cost)
  end
end
