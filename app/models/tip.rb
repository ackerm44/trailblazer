class Tip < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :trail, dependent: :destroy
end
