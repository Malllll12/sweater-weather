require 'rails_helper'

describe BackgroundFacade do
  it 'creates an image', :vcr do
    photo = BackgroundFacade.get_photo('montrose,co')
    expect(photo).to be_a(Background)
  end
end
