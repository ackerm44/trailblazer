module QuestionsHelper

  def questions_with_answers(current_user)
    current_user.questions.select {|q| q.answers != []}
  end
end
