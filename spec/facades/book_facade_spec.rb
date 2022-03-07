require 'rails_helper'

RSpec.describe 'BookFacade', :vcr do
  it 'returns book data' do
    data = BookFacade.get_library('telluride,co', 5)
    expect(data[:books][0]).to be_a(Book)
    expect(data[:books][0].title).to be_a(String)
    expect(data[:books][1].isbn).to be_a(Array)
    expect(data[:books][0].publisher).to be_a(Array)
    expect(data[:total_books_found]).to eq(39940)
  end
end
