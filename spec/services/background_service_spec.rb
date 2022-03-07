require 'rails_helper'

RSpec.describe BackgroundService do
  it 'gets photos of a city by city name', :vcr do

    image = BackgroundService.get_image("montrose,co")
    expect(image).to be_a(Hash)
    expect(image).to have_key(:results)
    expect(image[:results]).to be_an(Array)

    image_results = image[:results][0]
    expect(image_results).to have_key(:description)
    expect(image_results[:description]).to be_a(String)
    expect(image_results).to have_key(:urls)
    expect(image_results[:urls]).to be_a(Hash)
    expect(image_results[:urls]).to have_key(:raw)
    expect(image_results[:urls]).to have_key(:full)
    expect(image_results[:urls]).to have_key(:regular)
    expect(image_results[:urls]).to have_key(:small)
    expect(image_results[:urls]).to have_key(:thumb)
    expect(image_results[:urls]).to have_key(:small_s3)
    expect(image_results).to have_key(:links)
    expect(image_results[:links]).to be_a(Hash)
    expect(image_results).to have_key(:user)
    expect(image_results[:user]).to be_a(Hash)
    expect(image_results[:user]).to have_key(:links)
    expect(image_results[:user]).to have_key(:name)
  end
end
