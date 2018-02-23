class QuestionsController < ApplicationController
  #only the creator of a questions can edit, update, destory
  before_action :set_question, :check_current_user, only: [:show, :edit, :update, :destroy, :next]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
  end

  def create
    @question = Question.create(question_params)
    render json: @question, status: 201
  end

  # def edit
  # end
  #
  # def update
  # end

  def destroy
    @question.destroy
  end

  def next
    @next_question = @question.next
    render json: @next_question
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def check_current_user
      # if current_user != @question.user
      #   redirect_to root_path
      # end
    end

    def question_params
      params.require(:question).permit(:title, :user_id, :trail_id)
    end

end
