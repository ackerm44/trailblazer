//     @resp = Faraday.get "https://trailapi-trailapi.p.mashape.com/?q[activities_activity_type_name_eq]=hiking&q[state_cont]=michigan" do |req|
    //   req.headers['x-mashape-key'] = ENV['TRAIL_API_KEY']
    //   req.headers['accept'] = 'text/plain'
    //   req.options.timeout = 10
    // end
    // body_hash = JSON.parse(@resp.body)
    // @trails = body_hash["places"]
