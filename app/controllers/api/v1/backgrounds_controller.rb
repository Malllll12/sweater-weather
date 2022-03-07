class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundFacade.get_photo(params[:location])
    render json: BackgroundSerializer.image_json(image)
  end
end
