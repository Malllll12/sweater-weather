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
    @dt = Time.at(data[:current]["dt"]).strftime("%Y-%d-%m %H:%M:%S %z")
    @sunrise = Time.at(data[:current]["sunrise"]).strftime("%Y-%d-%m %H:%M:%S %z")
    @sunset = Time.at(data[:current]["sunset"]).strftime("%Y-%d-%m %H:%M:%S %z")
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end
end
