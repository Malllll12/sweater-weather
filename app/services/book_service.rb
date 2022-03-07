class BookService
  def self.conn
    conn = Faraday.new('https://openlibrary.org/search.json')
  end

  def self.get_books(location, quantity)
    response = conn.get("?q=#{location}&limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
