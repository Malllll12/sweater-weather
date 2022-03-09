class LocationService

  def self.long_lat_coords(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params[:location] = location
    end
    parsed(response)
  end

  def self.get_directions(origin, destination)
    response = conn.get("/directions/v2/route?") do |req|
      req.params[:from] = origin
      req.params[:to] = destination
    end
    parsed(response)
  end

  def self.parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
