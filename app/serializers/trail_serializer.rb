class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :nearest_city, :directions, :distance, :dog_friendly, :user_submitted, :region_id, :list_ids, :user_ids
end
