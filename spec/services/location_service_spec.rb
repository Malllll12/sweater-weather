require 'rails_helper'

RSpec.describe LocationService do
  it 'returns data for a location', :vcr do
    location = LocationService.long_lat_coords('denver,co')

    expect(location).to be_a(Hash)
    expect(location[:results]).to be_an(Array)
    expect(location[:results].first).to have_key(:locations)
    expect(location[:results].first[:locations].first).to have_key(:latLng)
  end
end
