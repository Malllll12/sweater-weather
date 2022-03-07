class BookFacade
  def self.get_library(location, quantity)
    books = BookService.get_books(location, quantity)
    books_data = Hash.new
    books_data[:books] = books[:docs].map do |book|
      Book.new(book)
    end
    books_data[:total_books_found] = books[:numFound]
    books_data
    end
  end
