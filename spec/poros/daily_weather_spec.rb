require "rails_helper"

RSpec.describe DailyWeather do
  it 'exists and has attributes' do
    data = {
            "dt": 1646593200,
            "sunrise": 1646573135,
            "sunset": 1646614624,
            "moonrise": 1646580900,
            "moonset": 1646630640,
            "moon_phase": 0.14,
            "temp": {"day"=>24.28, :min=>21.31, :max=>26.17, "night"=>21.31, "eve"=>23.58, "morn"=>22.73},
            "feels_like": {"day"=>15.24, "night"=>11.46, "eve"=>14.13, "morn"=>14.94},
            "pressure": 1020,
            "humidity": 74,
            "dew_point": 265.43,
            "wind_speed": 4.72,
            "wind_deg": 28,
            "wind_gust": 5.73,
            "weather": [ {"id": 600, "main": "Snow", "description": "light snow","icon": "13d"}],
            "clouds": 100,
            "pop": 0.96,
            "snow": 3.79,
            "uvi": 3.02}

    daily = DailyWeather.new(data)
    expect(daily.date).to be_a(String)
    expect(daily.sunrise).to eq("2022-06-03 06:25:35 -0700")
    expect(daily.sunset).to eq("2022-06-03 17:57:04 -0700")
    expect(daily.max_temp).to eq(26.17)
    expect(daily.min_temp).to eq(21.31)
    expect(daily.conditions).to eq("light snow")
    expect(daily.icon).to eq("13d")
  end
end
