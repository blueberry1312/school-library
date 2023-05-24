require_relative('spec_helper')
require 'fileutils'

RSpec.describe BookMethod do
  let(:json_file) { 'books_test.json' }
  let(:book_method) { described_class.new(json_file) }

  before(:each) do
    FileUtils.rm_f(json_file)
    book_method.books = []
  end

  describe '#initialize' do
    context 'when the JSON file exists' do
      it 'loads books from the JSON file' do
        File.write(json_file, '[{"title":"Book 1","author":"Author 1"}]')
        expect { book_method.load_books_from_json(json_file) }.to change { book_method.books.length }.from(0).to(1)
      end
    end

    context 'when the JSON file does not exist' do
      it 'does not load any books' do
        expect { book_method.load_books_from_json(json_file) }.not_to(change { book_method.books.length })
      end
    end
  end

  describe '#list_all_books' do
    context 'when the book list is empty' do
      it 'prints a message indicating no books found' do
        expect { book_method.list_all_books }.to output(/There's no books stored yet/).to_stdout
      end
    end
  end

  describe '#save_books_to_json' do
    it 'saves the books to the JSON file' do
      book_method.books << Book.new('Book 1', 'Author 1')
      book_method.books << Book.new('Book 2', 'Author 2')

      expect { book_method.save_books_to_json }.to change { File.exist?(json_file) }.from(false).to(true)

      file_data = File.read(json_file)
      expect(JSON.parse(file_data)).to eq([
                                            { 'title' => 'Book 1', 'author' => 'Author 1' },
                                            { 'title' => 'Book 2', 'author' => 'Author 2' }
                                          ])
    end
  end

  describe '#load_books_from_json' do
    context 'when the JSON file exists' do
      before(:each) do
        File.write(json_file, '[{"title":"Book 1","author":"Author 1"}]')
      end

      it 'loads the books from the JSON file' do
        expect { book_method.load_books_from_json(json_file) }.to change { book_method.books.length }.from(0).to(1)

        expect(book_method.books.first.title).to eq('Book 1')
        expect(book_method.books.first.author).to eq('Author 1')
      end
    end

    context 'when the JSON file does not exist' do
      it 'does not load any books' do
        expect { book_method.load_books_from_json(json_file) }.not_to(change { book_method.books.length })
      end
    end
  end
end
