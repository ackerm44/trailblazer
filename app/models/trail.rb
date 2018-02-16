class Trail < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :lists
  belongs_to :region
  has_many :questions
  has_many :tips

  accepts_nested_attributes_for :region

  def assign_region
    if self.longitude < -87
      self.region = Region.find(5)
    elsif self.longitude > -87 && self.latitude > 45.84
      self.region = Region.find(6)
    elsif self.longitude > -84.7 && self.latitude > 43.4 && self.latitude < 45.84
      self.region = Region.find(2)
    elsif self.longitude < -84.7 && self.latitude < 43.4
      self.region = Region.find(3)
    elsif self.longitude > -84.7 && self.latitude < 43.4
      self.region = Region.find(4)
    else
      self.region = Region.find(1)
    end
  end

end
