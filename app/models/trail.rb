class Trail < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :lists
  belongs_to :region
  has_many :questions
  has_many :tips

  accepts_nested_attributes_for :region

  def assign_region(trail)
    if trail['lon'] < -87
      trail.region = Region.find(5)
    end
  end

end
