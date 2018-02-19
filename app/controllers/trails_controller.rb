class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  def index
    @regions = Region.all
    if !params[:query].nil?
      @trails = Trail.search_by_name(params[:query])
    end
  end

  def show
    @lists = current_user.lists
    @user = current_user.username
    @tip = Tip.new
    @question = Question.new
    @answer = Answer.new
  end

  def new
    @trail = Trail.new
    @trail.build_region
  end

  def create
    binding.pry
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
    # binding.pry
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
    params.require(:trail).permit(:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region_id, :user_submitted, :list_ids, :user_ids)
  end

end
