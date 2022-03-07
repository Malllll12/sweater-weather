require 'rails_helper'

RSpec.describe "Book API" do
  it "returns book endpoint", :vcr do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    books = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response.status).to be(200)

    expect(books).to have_key(:id)
    expect(books[:id]).to eq("null")
    expect(books).to have_key(:type)
    expect(books[:type]).to eq("books")

    expect(books[:attribute]).to have_key(:destination)
    expect(books[:attribute][:destination]).to have_key(:latitude)
    expect(books[:attribute][:destination]).to have_key(:longitude)
    expect(books[:attribute]).to have_key(:forecast)
    expect(books[:attribute][:forecast]).to have_key(:summary)
    expect(books[:attribute][:forecast]).to have_key(:temperature)
    expect(books[:attribute]).to have_key(:total_books_found)
    expect(books[:attribute][:total_books_found]).to eq(41867)
    expect(books[:attribute]).to have_key(:books)
    expect(books[:attribute][:books].count).to eq(5)
    expect(books[:attribute][:books][0]).to have_key(:title)
    expect(books[:attribute][:books][0]).to have_key(:isbn)
    expect(books[:attribute][:books][0]).to have_key(:publisher)
  end
end
