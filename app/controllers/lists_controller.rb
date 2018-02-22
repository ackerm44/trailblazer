class ListsController < ApplicationController
  before_action :set_list, :check_current_user, only: [:show, :edit, :update, :destroy]

  # def index
  # end

  def show
  end

  def new

    @list = List.new
    @trail = @list.trails.build
  end

  def create
    raise params.inspect
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
    params.require(:list).permit(:name, :description, :user_id, :trail_id, :trail)
  end

end



# "utf8"=>"✓",
# "authenticity_token"=>"9jx4xZq3YFoHC2dsJLOHyfwNh7ZvQl/UlfipLS/QvAPkLW8OYyO3FxPb4AfKdNWrlbANayYf/JuYJftRaz+mwQ==",
# "list"=>{
#   "name"=>"Rocky's Favorite Hikes",
#   "description"=>"Rocky's favorite places to go during all seasons",
#   "user_id"=>"3",
#   "trail_ids"=>"",
#   "trail"=>{
#     "name"=>
#     "Rocky's Trail",
#     "nearest_city"=>"Traverse City",
#     "directions"=>"Supply to Hobbs to state land on left",
#     "distance"=>"6.5",
#     "description"=>"Off road two track, very sandy with some hills. Forested with access to small lake.",
#     "features"=>"",
#     "dog_friendly"=>"1", "region_id"=>"1", "user_submitted"=>"true"}}, "commit"=>"Create List", "controller"=>"lists", "action"=>"create"} permitted: false>
