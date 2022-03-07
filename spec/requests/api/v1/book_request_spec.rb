require 'rails_helper'

RSpec.describe "Book API" do
  it "returns book endpoint", :vcr do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    books = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response.status).to be(200)

    expect(books).to have_key(:id)
    expect(books).to have_key(:type)
    expect(books[:attributes]).to have_key(:destination)
    expect(books[:attributes]).to have_key(:forecast)
    expect(books[:attributes]).to have_key(:total_books_found)
    expect(books[:attributes]).to have_key(:books)
  end
end
# Assignment
# You will be using the “Open Library API” to search for books based on a destination city provided by the user. Presume that your user will give a known “good” location. (you can handle edge cases later)
# Your endpoint should follow this format:
# GET /api/v1/book-search?location=denver,co&quantity=5
# please do not deviate from the names of the endpoint or query parameter, be sure it is called “book-search” and “location” and “quantity”, respectively
# quantity should be a positive integer greater than 0
# Your API will return:
# the destination city
# the forecast in that city right now
# the total number of search results found
# a quantity of books about the destination city
# Your response should be in the format below:
