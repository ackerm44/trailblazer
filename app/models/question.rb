class Question < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :answers
end
