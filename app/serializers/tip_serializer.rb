class TipSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user_id, :trail_id
  belongs_to :user
  belongs_to :trail
end
