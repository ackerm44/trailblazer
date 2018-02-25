class TipsController < ApplicationController
  #only the creating user can edit, update, destory tip
  before_action :set_tip, :check_current_user, only: [:destroy]

  def index
    @tips = current_user.tips
    render json: @tips
  end

  def new
  end

  def create
    @tip = Tip.create(tip_params)
    render json: @tip, status: 201
  end

  def destroy
    @tip.destroy
    redirect_to request.referer
  end

  private
  def set_tip
    @tip = Tip.find(params[:id])
  end

  def check_current_user
    if current_user != @tip.user
      redirect_to root_path
    end
  end

  def tip_params
    params.require(:tip).permit(:comment, :user_id, :trail_id)
  end


end
