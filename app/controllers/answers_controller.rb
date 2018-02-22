class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  #only the creator of an answer can edit, update, destroy

  # def index
  # end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    respond_to do |f|
      f.html {redirect_to question_path(@question) }
      f.json {render json: @answer, status: 201}
    end
  end

  def edit
    @question = Question.find(params[:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

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
