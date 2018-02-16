class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  def index
    @regions ||= Region.all
  end

  def show
  end

  def new
    @trail = Trail.new
    @trail.build_region
  end

  def create
    @trail = Trail.new(trail_params)
    #raise params.inspect
    if @trail.save
      redirect_to trails_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trail.update(trail_params)
      redirect_to trail_path(@trail)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_trail
    @trail = Trail.find(params[:id])
  end

  def trail_params
    params.require(:trail).permit(:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region_id)
  end

end
