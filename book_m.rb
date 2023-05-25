require_relative 'book'
require_relative 'general_m'
require_relative 'user_input'
require 'json'

class BookMethod < GeneralMethod
  attr_accessor :books

  def initialize(json_file = 'books.json')
    super()
    @books = []
    @json_file = json_file
    load_books_from_json(json_file)
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

  def save_books_to_json
    File.write(@json_file, JSON.pretty_generate(@books.map(&:to_h)))
  end

  def load_books_from_json(json_file)
    if File.exist?(json_file)
      file = File.read(json_file)
      book_data = JSON.parse(file)
      @books = book_data.map { |data| Book.new(data['title'], data['author']) }
    else
      puts 'No books data found.'
    end
  end
end
