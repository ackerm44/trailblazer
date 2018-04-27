task :getTrails => :environment do
  Trail.delete_all

  Trail.get_api_data

end
