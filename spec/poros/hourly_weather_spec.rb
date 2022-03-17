require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes' do
    data =  {
              "dt": 1646596800,
              "temp": 23.9,
              "feels_like": 14.97,
              "pressure": 1019,
              "humidity": 78,
              "dew_point": 19.24,
              "uvi": 2.39,
              "clouds": 100,
              "visibility": 4303,
              "wind_speed": 8.01,
              "wind_deg": 29,
              "wind_gust": 4.26,
              "weather": [{"id": 600,  "main": "Snow",  "description": "light snow",  "icon": "13d"  }],
            "pop": 0.8,
            "snow": { "1h": 0.13}}

    hourly = HourlyWeather.new(data)
    expect(hourly.time).to be_a(String)
    expect(hourly.temp).to eq(23.9)
    expect(hourly.conditions).to eq("light snow")
    expect(hourly.icon).to eq("13d")
  end
end
