class List < ApplicationRecord
  belongs_to :user
  has_many :lists_trails
  has_many :trails, through: :lists_trails


  accepts_nested_attributes_for :trails

  def trail_attributes=(trails_attributes)
    if !trails_attributes.name.empty?
      trails_attributes.values.each do |trail_attribute|
        trail = Trail.find_or_create_by(trail_attribute)
        list.trails << trail
      end
    end
  end


end
