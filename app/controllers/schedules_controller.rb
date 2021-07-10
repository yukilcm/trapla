class SchedulesController < ApplicationController
  def index
    @travel = current_user.travels.find(params[:travel_id])
  end
end
