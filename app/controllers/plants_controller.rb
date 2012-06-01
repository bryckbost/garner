class PlantsController < ApplicationController
  before_filter :require_authentication

  def index
    @harvested = current_user.plants.harvested.sort_by(&:harvest_at)
    @growing = current_user.plants.growing.sort_by(&:harvest_at)
    
    respond_to do |format|
      format.html
      format.ics { @growing }
    end
  end
  
  def new
    @plant = current_user.plants.build
  end
  
  def create
    @plant = current_user.plants.build(params[:plant])
    
    if @plant.save
      redirect_to plants_path
    end
  end
  
  def edit
    @plant = current_user.plants.find(params[:id])
  end
  
  def update
    @plant = current_user.plants.find(params[:id])
    
    if @plant.update_attributes(params[:plant])
      redirect_to plants_path
    end
  end
end
