class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :trail_id
  belongs_to :user
end
