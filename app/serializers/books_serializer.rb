class BooksSerializer
  def self.serialize(data, location, weather)
    { data: {
            id: "null",
            type: "books",
            attribute: {
                        destination: location,
                        forecast: {
                                    summary: weather.conditions,
                                    temperature: weather.temperature
                                  },
                        total_books_found: data[:total_books_found],
                        books: data[:books]}}}
  end
end
