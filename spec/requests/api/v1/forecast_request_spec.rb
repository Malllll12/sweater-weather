require 'rails_helper'

RSpec.describe "Forecast API" do
  describe "happy path" do
    it "returns forecast attributes" do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast).to be_a(Hash)
      expect(forecast[:id]).to eq("null")
      expect(forecast[:type]).to eq("forecast")
      expect(forecast[:attributes][:current_weather]).to be_a(Hash)
      expect(forecast[:attributes][:current_weather][:datetime]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather][:uvi]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather][:conditions]).to be_a(String)
      expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)
      expect(forecast[:attributes][:daily_weather]).to be_a(Hash)
      expect(forecast[:attributes][:daily_weather][:date]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:sunset]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:max_temp]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:min_temp]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:conditions]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][:icon]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather]).to be_a(Hash)
      expect(forecast[:attributes][:hourly_weather][:time]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][:temperature]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][:conditions]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][:icon]).to be_a(String)
    end
  end

  describe "sad path" do
    it 'will not return forecast without a location' do
      get '/api/v1/forecast?location='

      expect(response.status).to eq(400)
    end

    it 'will not return forecast without a correct location' do
      get '/api/v1/forecast?location=jenver,co'

      expect(response.status).to eq(400)
    end
  end
end
