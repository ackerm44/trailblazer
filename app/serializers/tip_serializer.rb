class TipSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user_id, :trail_id
end
