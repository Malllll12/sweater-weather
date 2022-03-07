require 'rails_helper'

RSpec.describe BookService do
  it "returns book data", :vcr do
    data = BookService.get_books("Telluride,CO", 5)
    expect(data).to be_a(Hash)
    expect(data[:docs]).to be_an Array
    expect(data[:docs][0]).to have_key(:title)
    expect(data[:docs][1]).to have_key(:isbn)
    expect(data[:docs][0]).to have_key(:publisher)
  end
end
