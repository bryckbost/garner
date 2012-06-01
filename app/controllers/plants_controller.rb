class PlantsController < ApplicationController
  def index
    @harvested = Plant.harvested.sort_by(&:harvest_at)
    @growing = Plant.growing.sort_by(&:harvest_at)
    
    respond_to do |format|
      format.html
      format.ics { @growing }
    end
  end
  
  def new
    @plant = Plant.new
  end
  
  def create
    @plant = Plant.new(params[:plant])
    
    if @plant.save
      redirect_to plants_path
    end
  end
  
  def edit
    @plant = Plant.find(params[:id])
  end
  
  def update
    @plant = Plant.find(params[:id])
    
    if @plant.update_attributes(params[:plant])
      redirect_to plants_path
    end
  end
end
