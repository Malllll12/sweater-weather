class WeatherFacade
  def self.current_weather(latitude, longitude)
    current_weather_info = WeatherService.get_forecast(latitude, longitude)[:current]
    CurrentWeather.new(current_weather_info)
  end

  def self.daily_weather(latitude, longitude)
    five_days_data = WeatherService.get_forecast(latitude, longitude)[:daily].first(5)
    five_days_data.map do |day_data|
      DailyWeather.new(day_data)
    end
  end

  def self.hourly_weather(latitude, longitude)
    eight_hours_data = WeatherService.get_forecast(latitude, longitude)[:hourly].first(8)
    eight_hours_data.map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end

  def self.arrival_weather(latitude, longitude, time)
    arrival = time.split(":").first.to_i
    data = WeatherService.get_forecast(latitude, longitude)
    forecast = data[:hourly].map do |data|
      Trip.new(data)
    end
    forecast[arrival]
  end
end
