require_relative 'book'
require_relative 'general_m'

class BookMethod < GeneralMethod
  attr_accesor :people

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
    title, author = book_d

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def book_d
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end
