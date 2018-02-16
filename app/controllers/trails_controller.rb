class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  def index
    @regions ||= Region.all
    @resp = Faraday.get "https://trailapi-trailapi.p.mashape.com/?q[activities_activity_type_name_eq]=hiking&q[state_cont]=michigan" do |req|
      req.headers['x-mashape-key'] = ENV['TRAIL_API_KEY']
      req.headers['accept'] = 'text/plain'
      req.options.timeout = 10
    end
    body_hash = JSON.parse(@resp.body)
    trails = body_hash["places"]
    @trails = trails.map {|trail| Trail.new(name: trail['name'], nearest_city: trail['city'], description: trail['activities'][0]['description'], distance: trail['activities'][0]['length'], directions: trail['directions'], latitude: trail['lat'], longitude: trail['lon'], user_submitted: false, )}
    @trails.each do |trail|
      trail.assign_region
    end
    @trails.save
  end

  # require 'json'
  #
  # data = JSON.parse(json_data)
  # residents = data['Resident'].map { |rd| Resident.new(rd['phone'], rd['addr']) }


  # def trails_api
  #   @resp = Faraday.get "https://trailapi-trailapi.p.mashape.com/?q[activities_activity_type_name_eq]=hiking&q[state_cont]=michigan" do |req|
  #     req.headers['x-mashape-key'] = ENV['TRAIL_API_KEY']
  #     req.headers['accept'] = 'text/plain'
  #     req.options.timeout = 10
  #   end
  #   body_hash = JSON.parse(@resp.body)
  #   @trails = body_hash["places"]
  #
  # end

  def show
  end

  def new
    @trail = Trail.new
    @trail.build_region
  end

  def create
    @trail = Trail.new(trail_params)
    #raise params.inspect
    if @trail.save
      redirect_to trails_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trail.update(trail_params)
      redirect_to trail_path(@trail)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_trail
    @trail = Trail.find(params[:id])
  end

  def trail_params
    params.require(:trail).permit(:name, :nearest_city, :directions, :distance, :description, :features, :dog_friendly, :region_id)
  end

end
