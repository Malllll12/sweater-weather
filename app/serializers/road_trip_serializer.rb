class RoadTripSerializer
  def self.serialize(destination, origin, time, forecast)
    {
      data: {
        id: "null",
        type: "roadtrip",
        attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: time,
            weather_at_eta: {
                temperature: forecast.temperature,
                conditions: forecast.conditions
            }
          }
        }
      }
  end
end
