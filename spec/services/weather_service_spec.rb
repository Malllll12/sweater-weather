require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns data for a location', :vcr do
    weather = WeatherService.get_forecast('39.738453', '-104.984853')

    expect(weather).to be_a(Hash)
    expect(weather[:current]).to have_key(:dt)
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:temp)
    expect(weather[:current]).to have_key(:feels_like)
    expect(weather[:current]).to have_key(:humidity)
    expect(weather[:current]).to have_key(:uvi)
    expect(weather[:current]).to have_key(:visibility)
    expect(weather[:current][:weather].first).to have_key(:icon)
    expect(weather[:daily].first).to have_key(:dt)
    expect(weather[:daily].first).to have_key(:sunrise)
    expect(weather[:daily].first).to have_key(:sunset)
    expect(weather[:daily].first[:temp]).to have_key(:min)
    expect(weather[:daily].first[:temp]).to have_key(:max)
    expect(weather[:daily].first[:weather].first).to have_key(:icon)
    expect(weather[:hourly].first).to have_key(:dt)
    expect(weather[:hourly].first).to have_key(:temp)
    expect(weather[:hourly].first[:weather].first).to have_key(:icon)
  end
end
