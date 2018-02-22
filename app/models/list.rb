class List < ApplicationRecord
  belongs_to :user
  has_many :lists_trails
  has_many :trails, through: :lists_trails
  accepts_nested_attributes_for :lists_trails
  accepts_nested_attributes_for :trails


  def trails_attributes=(trails_attributes)
    trails_attributes.values.each do |trail_attribute|
      if !trail_attribute[:name].empty?
        trail = Trail.find_or_create_by(trail_attribute)
        self.trails << trail
      end
    end
  end


end
