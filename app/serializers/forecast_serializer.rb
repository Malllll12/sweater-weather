class ForecastSerializer
  def self.serialize(data)
    {
      data: {
            id: "null",
            type: 'forecast',
            attributes: {
                current_weather: data[:current_weather],
                daily_weather: data[:daily_weather],
                hourly_weather: data[:hourly_weather]
                }
              }
            }
  end
end
