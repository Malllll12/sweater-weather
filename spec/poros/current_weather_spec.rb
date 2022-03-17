require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    data ={
            :dt =>1646596243,
            :sunrise=>1646573135,
            :sunset=>1646614624,
            "temp": 23.9,
            "feels_like": 14.97,
            "pressure": 1018,
            "humidity": 80,
            "dew_point": 19.24,
            "uvi": 2.39,
            "clouds": 100,
            "visibility": 4308,
            "wind_speed": 8.01,
            "wind_deg": 34,
            "wind_gust": 13,
            "weather": [{"id": 600, "main": "Snow", "description": "light snow", "icon": "13d"  }],
            "snow": { "1h": 0.21}}

    current = CurrentWeather.new(data)
    expect(current.dt).to be_a(String)
    expect(current.sunrise).to be_a(String)
    expect(current.sunset).to be_a(String)
    expect(current.temperature).to eq(23.9)
    expect(current.feels_like).to eq(14.97)
    expect(current.humidity).to eq(80)
    expect(current.uvi).to eq(2.39)
    expect(current.visibility).to eq(4308)
    expect(current.conditions).to eq("light snow")
    expect(current.icon).to eq("13d")
  end
end
