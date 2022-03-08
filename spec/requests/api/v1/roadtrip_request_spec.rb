require 'rails_helper'

RSpec.describe "returns Roadtrip endpoint" do
  describe "happy path", :vcr do
    it "returns roadtrip data" do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {
                  "origin": "Lakewood,CO",
                  "destination": "Montrose,CO",
                  "api_key": user.api_key
                }
    post "/api/v1/road_trip", params: info, as: :json
    expect(response).to be_successful
    expect(response.status).to eq(201)

    trip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip).to have_key(:id)
    expect(trip[:id]).to eq("null")
    expect(trip).to have_key(:type)
    expect(trip[:type]).to eq("roadtrip")
    expect(trip[:attributes]).to have_key(:start_city)
    expect(trip[:attributes][:start_city]).to be_a(String)
    expect(trip[:attributes]).to have_key(:end_city)
    expect(trip[:attributes][:end_city]).to be_a(String)
    expect(trip[:attributes]).to have_key(:travel_time)
    expect(trip[:attributes][:travel_time]).to be_a(String)
    expect(trip[:attributes]).to have_key(:weather_at_eta)
    expect(trip[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(trip[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(trip[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(trip[:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(trip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end

  describe "sad path" do
    it "fails if no api_key is given", :vcr do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": nil
                }
    post "/api/v1/road_trip", params: info, as: :json
    expect(response.status).to eq(401)
    end

    it "fails if no destination is given", :vcr do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {
                  "origin": "Denver,CO",
                  "api_key": user.api_key
                }
    post "/api/v1/road_trip", params: info, as: :json
    expect(response.status).to eq(400)
    end

    it "responds with partial data if given impossible route", :vcr do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      info = {
                  "origin": "Denver,CO",
                  "destination": "Maui,HI",
                  "api_key": user.api_key
                }
    post "/api/v1/road_trip", params: info, as: :json
    expect(response).to be_successful
    expect(response.status).to eq(200)

    trip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip).to have_key(:id)
    expect(trip[:id]).to eq("null")
    expect(trip).to have_key(:type)
    expect(trip[:type]).to eq("roadtrip")
    expect(trip[:attributes]).to have_key(:start_city)
    expect(trip[:attributes][:start_city]).to be_a(String)
    expect(trip[:attributes]).to have_key(:end_city)
    expect(trip[:attributes][:end_city]).to be_a(String)
    expect(trip[:attributes]).to have_key(:travel_time)
    expect(trip[:attributes][:travel_time]).to be_a(String)
    expect(trip[:attributes][:travel_time]).to eq("impossible route")
    expect(trip[:attributes]).to_not have_key(:weather_at_eta)
    end
  end
end
