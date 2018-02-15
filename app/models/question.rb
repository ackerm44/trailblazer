class Question < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :trail, dependent: :destroy
  has_many :answers
end
