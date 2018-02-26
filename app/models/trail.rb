class Trail < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :lists_trails
  has_many :lists, through: :lists_trails
  belongs_to :region
  has_many :questions
  has_many :tips

  validates :name, uniqueness: true

  accepts_nested_attributes_for :region, :lists

  def self.search_by_name(query)
    self.select {|t| t.name.downcase.include?(query)}
  end

  def self.search_by_city(city_query)
    self.select {|t| t.nearest_city.downcase.include?(city_query)}
  end

  # def alphabetical_next
  #   trails_in_region = Trail.where("region_id = ?", self.region_id)
  #   sort_alphabetically = trails_in_region.order(:name)
  #   next_record = sort_alphabetically.index(self) + 1
  #   sort_alphabetically[next_record]
  # end

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

  private
  def self.get_api_data
    @resp = Faraday.get "https://trailapi-trailapi.p.mashape.com/?limit=500&q[activities_activity_type_name_eq]=hiking&q[state_cont]=michigan" do |req|
      req.headers['x-mashape-key'] = ENV['TRAIL_API_KEY']
      req.headers['accept'] = 'text/plain'
      req.options.timeout = 10
    end
    body_hash = JSON.parse(@resp.body)
    trails = body_hash["places"]
    @trails = trails.map {|trail| Trail.new(name: trail['name'], nearest_city: trail['city'], description: trail['activities'][0]['description'], distance: trail['activities'][0]['length'], directions: trail['directions'], latitude: trail['lat'], longitude: trail['lon'], user_submitted: false, )}
    @trails.each do |trail|
      trail.assign_region
      if trail.valid?
        trail.save
      end
    end

  end

end
