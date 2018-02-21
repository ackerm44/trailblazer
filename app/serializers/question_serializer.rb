class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :trail_id, :created_at
  belongs_to :user
  belongs_to :trail
end
