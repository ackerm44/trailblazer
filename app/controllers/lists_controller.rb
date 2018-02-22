class ListsController < ApplicationController
  before_action :set_list, :check_current_user, only: [:show, :edit, :update, :destroy]

  # def index
  # end

  def show
  end

  def new
    @list = List.new
    @lists_trail = @list.lists_trails.build
    @trail = @list.trails.build
  end

  def create
    # raise params.inspect
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
  end

  def destroy
    @list.destroy
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def check_current_user
    if current_user != @list.user
      redirect_to root_path
      #Enter an error message????
    end
  end

  def list_params
    params.require(:list).permit(:name, :description, :user_id, :trail_ids,
      :trails_attributes => [:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region_id, :user_submitted])
  end

end



# <ActionController::Parameters
# {"utf8"=>"✓",
#   "authenticity_token"=>"jsQLgoB7W4Q6A9CkgEnyd93gE8/BClshrjsuhMHdzPCc1RxJee+MyS7TV89ujqAVtF2ZEohX+G6j5nz4hTLWMg==",
#   "list"=>{
#     "name"=>"Tset asldjalsd",
#     "description"=>"sljlksjsflskjdf",
#     "user_id"=>"3",
#     "trail_ids"=>"256",
#     "trails_attributes"=>{
#       "0"=>{
#         "name"=>"",
#         "nearest_city"=>"",
#         "directions"=>"",
#         "distance"=>"",
#         "description"=>"", "features"=>"", "dog_friendly"=>"0", "region_id"=>"", "user_submitted"=>"true"}}}, "commit"=>"Create List", "controller"=>"lists", "action"=>"create"} permitted: false>
