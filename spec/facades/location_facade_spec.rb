require 'rails_helper'

RSpec.describe LocationFacade do
  it "returns a location", :vcr do
    location = LocationFacade.get_location("montrose, co")
    expect(location).to be_a(Location)
    expect(location.latitude).to eq(38.478034)
    expect(location.longitude).to eq(-107.876806)
  end
end
