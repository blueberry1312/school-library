require_relative 'book'
require_relative 'general_m'
require_relative 'user_input'

class BookMethod < GeneralMethod
  attr_accessor :books

  def initialize
    super
    @books = []
  end

  def list_all_books
    check_empty_list(@books, 'books')

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    title, author = book_data

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def book_data
    title = user_input(['Title'])[0]
    author = user_input(['Author'])[0]

    [title, author]
  end
end
