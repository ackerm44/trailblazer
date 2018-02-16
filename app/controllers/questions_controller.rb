class QuestionsController < ApplicationController
  #only the creator of a questions can edit, update, destory

  def index
    #render in json on trails show
  end

  def new
  end

  def create
    @question = Question.create(question_params)
    render json: @question, status: 201
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def question_params
      params.require(:question).permit(:title, :user_id, :trail_id)
    end

end
