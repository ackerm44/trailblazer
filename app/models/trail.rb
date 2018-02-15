class Trail < ApplicationRecord
  has_many :users
  has_many :lists
  belongs_to :region
  has_many :questions
  has_many :tips
end
