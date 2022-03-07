require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns current_weather poro', :vcr do
    forecast = WeatherFacade.current_weather(39.738453, -104.984853)
    expect(forecast).to be_an_instance_of(CurrentWeather)
  end

  it 'returns current_weather poro', :vcr do
    forecast = WeatherFacade.daily_weather(39.738453, -104.984853)
    expect(forecast.first).to be_an_instance_of(DailyWeather)
    expect(forecast.count).to eq(5)
  end

  it 'returns current_weather poro', :vcr do
    forecast = WeatherFacade.hourly_weather(39.738453, -104.984853)
    expect(forecast.first).to be_an_instance_of(HourlyWeather)
    expect(forecast.count).to eq(8)
  end
end
