class LocationService

  def self.long_lat_coords(location)
    response = conn.get('address') do |req|
      req.params[:location] = location
    end
    parsed(response)
  end

  def self.parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
