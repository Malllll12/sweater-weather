class Api::V1::UsersController < ApplicationController
  def create
    if User.find_by email: params[:email]
      render json: { error: [ "Account exists. Please Log in." ] }, status: 400
    else
      if params[:password] == params[:password_confirmation]
        user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: User.api_key_generate)
        if user.save
          render json: UserSerializer.serialize(user), status: 201
        else
          render json: { error: [ "Empty field detected" ]}, status: 400
        end
      else
        render json: { error: [ "Passwords do no match" ]}, status: 400
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
