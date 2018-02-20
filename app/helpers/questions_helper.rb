module QuestionsHelper

  def questions_with_answers(current_user)
    current_user.questions.select {|q| q.answers != []}
  end

  def user_question_delete(current_user, question)
    if current_user == question.user
      link_to "Delete", question_path(question), :method => 'delete'
    end
  end
end
