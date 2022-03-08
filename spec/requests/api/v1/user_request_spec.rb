require 'rails_helper'

RSpec.describe "user API" do
  describe 'happy path' do
    it "creates a new user", :vcr do
      info = {"email": "fake@example.com",
              "password": "seacret",
              "password_confirmation": "seacret"}
      post '/api/v1/users', params: info, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user[:id]).to be_a(String)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:api_key)
      expect(user[:attributes][:api_key]).to be_a(String)
      expect(user[:attributes]).to_not have_key(:password)
      expect(user[:attributes]).to_not have_key(:password_confirmation)
    end
  end

  describe "sad path" do
    it 'returns an error with incomplete credentials' do
      info = {"email": 'fake@example.com'}
      post '/api/v1/users', params: info, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end

    it 'returns an error if credentials are not matching' do
      info = {"email": 'fake@example.com',
              "password": "seacret",
              "password_confirmation": "ryanseacret"}
      post '/api/v1/users', params: info, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
