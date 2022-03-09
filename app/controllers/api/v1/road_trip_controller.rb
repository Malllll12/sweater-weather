class Api::V1::RoadTripController < ApplicationController
  def create
    if user = User.find_by(api_key: params[:api_key])
      if params[:origin].nil? || params[:destination].nil?
        render json: { errors: "Route cannot exist" }, status: 400
      elsif
        time = LocationFacade.get_trip(params[:origin], params[:destination])
        coords = LocationFacade.get_location(params[:destination])
        forecast = WeatherFacade.arrival_weather(coords.latitude, coords.longitude, time)
        render json: RoadTripSerializer.serialize(params[:destination], params[:origin], time, forecast), status: 201
      else
        render json: RoadTripSerializer.impossible(params[:destination], params[:origin]), status: 200
      end
    else
      render json: { errors: "Please use correct credentials"}, status: 401
    end
  end
end
