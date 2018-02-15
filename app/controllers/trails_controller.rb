class TrailsController < ApplicationController

  def index
    @trails = Trail.all
  end

  def show
  end

  def new
    @trail = Trail.new
    @trail.build_region
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to trails_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region => [:region_id] )
  end

end
