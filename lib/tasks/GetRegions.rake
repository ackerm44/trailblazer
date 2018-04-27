task :getRegions => :environment do
  regions = [
    "Northwest Lower Peninsula", "Northeast Lower Peninsula",
    "Southwest Lower Peninsula", "Southeast Lower Peninsula",
    "Western Upper Peninsula", "Eastern Upper Peninsula"
  ]

  regions.each do |region|
    Region.create(name: region)
  end
end
