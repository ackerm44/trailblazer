class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :question_id, :created_at
  belongs_to :question
  belongs_to :user
end
