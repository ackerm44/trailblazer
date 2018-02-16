class ListsController < ApplicationController
  # All routes per current_user
  before_action :set_user

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
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end

  def list_params
    params.require(:list).permit(:name, :description, :user_id)
  end

end
