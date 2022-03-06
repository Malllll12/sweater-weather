require 'rails_helper'

RSpec.describe Location do
  it 'exists and has attributes' do
    data = { results:
            [ locations: [
              latLng:
                {lat: 39.738453, lng: -104.984853}
              ]]}
    location = Location.new(data)
    expect(location.lat).to eq(39.738453)
    expect(location.long).to eq(-104.984853)
  end
end
