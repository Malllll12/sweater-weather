require 'rails_helper'

RSpec.describe "Forecast request endpoint" do
  describe "happy path", :vcr do
    it "returns forecast attributes" do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast).to be_a(Hash)
      expect(forecast[:id]).to eq("null")
      expect(forecast[:type]).to eq("forecast")
      expect(forecast[:attributes][:current_weather]).to be_a(Hash)
      expect(forecast[:attributes][:current_weather][:dt]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather][:conditions]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)
      expect(forecast[:attributes][:daily_weather]).to be_a(Array)
      expect(forecast[:attributes][:daily_weather][0][:date]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0][:sunset]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0][:conditions]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0][:icon]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather]).to be_a(Array)
      expect(forecast[:attributes][:hourly_weather][0][:time]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0][:temp]).to be_a(Float)
      expect(forecast[:attributes][:hourly_weather][0][:conditions]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0][:icon]).to be_a(String)
    end
  end

  describe "sad path" do
    it 'will not return forecast without a location' do
      get '/api/v1/forecast?location='

      expect(response).to_not be_successful

      expect(response.status).to eq(404)
    end
  end
end
