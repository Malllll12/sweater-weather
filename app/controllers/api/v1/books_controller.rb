class Api::V1::BooksController < ApplicationController
  def index
    coords = LocationFacade.get_location(params[:location])
    weather = WeatherFacade.current_weather(coords.latitude, coords.longitude)
    books = BookFacade.get_library(params[:location], params[:quantity])
    render json: BooksSerializer.serialize(books, coords, weather)
  end
end
