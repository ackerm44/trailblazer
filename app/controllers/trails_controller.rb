class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy, :next]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @regions = Region.all
    if !params[:query].nil?
      @trails = Trail.search_by_name(params[:query])
    elsif !params[:city_query].nil?
      @trails = Trail.search_by_city(params[:city_query])

    end
  end

  def show
    @lists = current_user.lists
    @user = current_user.username
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
    if @trail.update(trail_params)
      redirect_to trail_path(@trail)
    else
      render :edit
    end
  end

  def destroy
    if current_user == @trail.users.first && @trail.user_submitted?
      @trail.destroy
      redirect_to trails_path
    end
  end

  # def next
  #   @next_trail = @trail.alphabetical_next
  #   render json: @next_trail
  # end

  private
  def set_trail
    @trail = Trail.find(params[:id])
  end

  def trail_params
    params.require(:trail).permit(:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region_id, :user_submitted, :list_ids, :user_ids)
  end

end
