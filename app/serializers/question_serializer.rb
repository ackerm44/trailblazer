class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :trail_id, :created_at, :answers
  belongs_to :user
  belongs_to :trail

  def answers
    custom_answers = []
    object.answers.each do |answer|
      custom_answer = answer.attributes

      custom_answer[:username] = answer.user.username
      custom_answer[:created_at] = answer.created_at
      custom_answer[:title] = answer.title

      custom_answers.push(custom_answer)
    end

    return custom_answers
  end

end
