class Region < ApplicationRecord
  has_many :trails
  has_many :users, through: :trails
end
