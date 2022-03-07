class Api::V1::ForecastController < ApplicationController
  def index
    coords = LocationFacade.get_location(params[:location])
    all = {
         current_weather: WeatherFacade.current_weather(coords.latitude, coords.longitude),
         daily_weather: WeatherFacade.daily_weather(coords.latitude, coords.longitude),
         hourly_weather: WeatherFacade.hourly_weather(coords.latitude, coords.longitude)
        }
    render json: ForecastSerializer.serialize(all)
  end
end
