class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
      @travel = current_user.travels.find(params[:travel_id])
  end  
end