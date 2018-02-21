class TrailSerializer < ActiveModel::Serializer
  attributes :id, :user_ids, :name, :list_ids
  has_and_belongs_to_many :users
  has_and_belongs_to_many :lists
end
