class CurrentWeather
  attr_reader :dt,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt]).strftime("%Y-%d-%m %H:%M:%S %z")
    @sunrise = Time.at(data[:sunrise]).strftime("%Y-%d-%m %H:%M:%S %z")
    @sunset = Time.at(data[:sunset]).strftime("%Y-%d-%m %H:%M:%S %z")
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
