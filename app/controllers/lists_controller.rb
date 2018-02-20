class ListsController < ApplicationController
  # All routes per current_user
  before_action :set_list, :check_current_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
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
    params.require(:list).permit(:name, :description, :user_id, :trail_id)
  end

end
