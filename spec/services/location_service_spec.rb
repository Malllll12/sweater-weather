require 'rails_helper'

RSpec.describe LocationService do
  it 'returns data for a location', :vcr do
    location = LocationService.long_lat_coords('denver,co')

    expect(location).to be_a(Hash)
    expect(location[:results]).to be_an(Array)
    expect(location[:results].first).to have_key(:locations)
    expect(location[:results].first[:locations].first).to have_key(:latLng)
  end

  it 'returns data for directions', :vcr do
    route = LocationService.get_directions('lakewood,co', 'montrose, co')

    expect(route).to be_a(Hash)
  end
end
