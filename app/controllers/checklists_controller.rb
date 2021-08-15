class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  def index
    @travel = current_user.travels.find(params[:travel_id])
    @checklists = @travel.checklists
  end
 
  def new
    @travel = current_user.travels.find(params[:travel_id])
    @checklist = @travel.checklists.new
  end
  
  def create
    @travel = current_user.travels.find(params[:travel_id])
    @checklist = @travel.checklists.new(checklist_params)
    @checklist.save!
    redirect_to travel_checklists_path(@travel)
  end
  
  def edit 
    @travel = current_user.travels.find(params[:travel_id])
    @checklist = @travel.checklists.find(params[:id])
  end
  
  def update
    @travel = current_user.travels.find(params[:travel_id])
    @checklist = @travel.checklists.find(params[:id])
    if @checklist.update(checklist_params)
      redirect_to travel_checklists_path(@travel)
    else
      render :edit
    end
  end
  
  def destroy 
    @travel = current_user.travels.find(params[:travel_id])
    @travel.checklists.find(params[:id]).destroy
    redirect_to travel_checklists_path(@travel)
  end

  
  private

  def checklist_params
    params.require(:checklist).permit(:checked, :title)
  end
end


