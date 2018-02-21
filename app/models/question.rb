class Question < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :answers

  def next
    Question.where("id > ?", id).first
  end
end
