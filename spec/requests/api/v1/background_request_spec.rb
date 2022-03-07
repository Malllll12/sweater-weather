require 'rails_helper'

describe 'background request endpoint' do
  it 'returns image', :vcr do
    get '/api/v1/backgrounds?location=montrose,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    background = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(background).to be_a(Hash)
    expect(background[:id]).to eq("null")
    expect(background[:type]).to eq('image')
    expect(background).to have_key(:attributes)
    image = background[:attributes][:image]

    expect(image).to have_key(:description)
    expect(image[:description]).to be_a(String)
    expect(image).to have_key(:image_url)
    expect(image[:image_url]).to be_a(String)
    expect(image).to have_key(:site)
    expect(image[:site]).to be_a(String)
    expect(image[:credit]).to have_key(:photographer)
    expect(image[:credit][:photographer]).to be_a(String)
    expect(image[:credit]).to have_key(:photographer_site)
    expect(image[:credit][:photographer_site]).to be_a(String)
  end
end
