class Question < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :answers

  def next
    question = Question.where("id > ?", id).first

    if question
      question
    else
      Question.first
    end
  end
end
