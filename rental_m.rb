require_relative 'rental'
require_relative 'user_input'
require 'json'
class RentalMethod
  def initialize
    @rentals = []
    load_rentals_from_json
  end

  def create_rental(peoples_m, books_m)
    date, book_index, person_index = rental_data(peoples_m, books_m)
    @rentals << Rental.new(date, books_m.instance_variable_get(:@books)[book_index], peoples_m.people[person_index])
    puts 'Rental created successfully'
  end

  def rental_data(peoples_m, books_m)
    book_index = select_book(books_m)
    person_index = select_person(peoples_m)
    date = user_input(['Date'])[0]
    [date, book_index, person_index]
  end

  def select_book(books_m)
    puts 'Select a book from the following list by number: '
    books_m.list_all_books
    user_input(['Book number'])[0].to_i
  end

  def select_person(peoples_m)
    puts 'Select a person from the following list by number (Not ID): '
    peoples_m.list_all_people
    user_input(['Person number'])[0].to_i
  end

  def list_rentals_by_person_id
    id = user_input(['ID of the person'])[0].to_i
    rentals = load_rentals_from_json

    rentals_by_id = rentals.select do |rental|
      rental.person.id == id
    end

    if rentals_by_id.empty?
      puts 'This person has no rentals'
    else
      puts "Rentals for person with ID #{id}:"
      rentals_by_id.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def save_rentals_to_json
    File.write('rentals.json', JSON.pretty_generate(@rentals.map(&:to_h)))
  end

  def load_rentals_from_json
    if File.exist?('rentals.json')
      file = File.read('rentals.json')
      rental_data = JSON.parse(file)
      rental_data.map do |data|
        person_data = data['person']
        book_data = data['book']
        person = Person.new(person_data['age'], person_data['name'], person_data['id'])
        book = Book.new(book_data['title'], book_data['author'])
        Rental.new(data['date'], book, person)
      end
    else
      puts 'No rentals data found.'
      []
    end
  end
end
