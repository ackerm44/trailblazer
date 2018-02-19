class AnswersController < ApplicationController
  #only the creator of an answer can edit, update, destroy

  def index
  end

  def new
  end

  def create
    @answer = Answer.create(answer_params)
    render json: @answer, status: 201
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :user_id, :question_id)
  end


end
