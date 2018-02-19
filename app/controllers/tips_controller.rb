class TipsController < ApplicationController
  #only the creating user can edit, update, destory tip

  def index
    #Ajax call on Trails show page
  end

  def new
  end

  def create
    @tip = Tip.create(tip_params)
    @user = @tip.user.username
    render json: @tip, status: 201
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def tip_params
    params.require(:tip).permit(:comment, :user_id, :trail_id)
  end


end
