class WeatherService
  def self.get_forecast(lat, long)
    response = conn.get('/data/2.5/onecall?') do |faraday|
      faraday.params[:lat] = lat
      faraday.params[:lon] = long
      faraday.params[:units] = 'imperial'
    end
    parsed(response)
  end

  def self.parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['WEATHER_API_KEY']
    end
  end
end
