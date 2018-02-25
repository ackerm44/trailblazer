class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def index
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

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
    redirect_to request.referer
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end


  def answer_params
    params.require(:answer).permit(:title, :user_id, :question_id)
  end


end
