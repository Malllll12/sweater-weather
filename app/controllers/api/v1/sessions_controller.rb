class Api::V1::SessionsController < ApplicationController
  def create
    session_user = User.find_by(email: params[:email])
    if session_user && session_user.authenticate(params[:password])
      session[:user_id] = session_user.id
      render json: UserSerializer.serialize(session_user), status: 201
    else
      render json: { error: "Your credentials are bad and you should feel bad."}, status: 400
    end
  end
end
