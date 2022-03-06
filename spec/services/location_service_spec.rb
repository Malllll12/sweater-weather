require 'rails_helper'

RSpec.describe LocationService do
  it 'returns data for a location', :vcr do
    location = LocationService.long_lat_coords('denver,co')

    expect(location).to be_a(Hash)
    expect(location[:results]).to be_an(Array)
  end
end
