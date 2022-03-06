class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:daily][0][:dt]).strftime('%Y-%m-%d')
    @sunrise = Time.at(data[:daily][0][:sunrise]).strftime("%I:%m %p")
    @sunset = Time.at(data[:daily][0][:sunset]).strftime("%I:%m %p")
    @max_temp = data[:daily][0][:temp]["max"]
    @min_temp = data[:daily][0][:temp]["min"]
    @conditions = data[:daily][0][:weather][0][:description]
    @icon = data[:daily][0][:weather][0][:icon]
  end
end
