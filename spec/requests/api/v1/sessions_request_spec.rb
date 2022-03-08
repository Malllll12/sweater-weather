require 'rails_helper'

RSpec.describe "sessions request endpoint" do
  describe "happy path" do
    it 'starts a session and returns user data' do
      User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {"email": "fake@example.com",
              "password": "seacret"}
      post '/api/v1/sessions', params: info, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(201)

      session = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(session[:id]).to be_a(String)
      expect(session[:attributes]).to have_key(:email)
      expect(session[:attributes][:email]).to be_a(String)
      expect(session[:attributes]).to have_key(:api_key)
      expect(session[:attributes][:api_key]).to be_a(String)
      expect(session[:attributes]).to_not have_key(:password)
    end
  end

  describe "sad path" do
    it 'it gives a credentials error if log in is bad' do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {"email": "real@example.com",
              "password": "secret"}
      post '/api/v1/sessions', params: info, as: :json
      expect(response.status).to eq(400)
    end
  end
end
