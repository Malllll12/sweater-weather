require 'rails_helper'

RSpec.describe Location do
  it 'exists and has attributes' do
    data = {
         :adminArea5=>"Denver",
         :adminArea5Type=>"City",
         :adminArea4=>"Denver County",
         :adminArea4Type=>"County",
         :adminArea3=>"CO",
         :adminArea3Type=>"State",
         :adminArea1=>"US",
         :adminArea1Type=>"Country",
         :latLng=>{:lat=>39.738453, :lng=>-104.984853}
          }
    location = Location.new(data)
    expect(location.latitude).to eq(39.738453)
    expect(location.longitude).to eq(-104.984853)
  end
end
