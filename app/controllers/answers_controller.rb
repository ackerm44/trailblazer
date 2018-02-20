class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  #only the creator of an answer can edit, update, destroy

  # def index
  # end

  # def new
  # end

  def create
    @answer = Answer.create(answer_params)
    render json: @answer, status: 201
  end

  # def edit
  # end
  #
  # def update
  #   if @answer.update(answer_params)
  #     redirect_to trail_path(@answer.trail)
  #   end
  # end

  def destroy
    @answer.destroy
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end


  def answer_params
    params.require(:answer).permit(:title, :user_id, :question_id)
  end


end
