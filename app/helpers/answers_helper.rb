module AnswersHelper

  def user_answer_edit(current_user, answer)
    if current_user == answer.user
      link_to "Edit Answer", edit_answer_path(answer)
    end

  end

  def user_answer_delete(current_user, answer)
    if current_user == answer.user
      link_to "Delete Answer", answer_path(answer), :method => 'delete'
    end
  end
  
end
