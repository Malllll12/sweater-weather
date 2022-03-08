require 'rails_helper'

RSpec.describe Trip do
  it 'exists and has attributes' do
    data = {
            temp: 34.07,
            weather: [
              description: "clear sky"]
          }

    trip = Trip.new(data)

    expect(trip.temperature).to be_a(Float)
    expect(trip.temperature).to eq(34.07)
    expect(trip.conditions).to be_a(String)
    expect(trip.conditions).to eq("clear sky")
  end
end
