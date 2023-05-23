require_relative 'rental'

class RentalMethod
  def initialize
    @rentals = []
  end

  def create_rental(peoples_m, books_m)
    date, book_index, person_index = rental_data(peoples_m, books_m)

    @rentals << Rental.new(date, books_m.instance_variable_get(:@books)[book_index], peoples_m.people[person_index])
    puts 'Rental created successfully'
  end

  def rental_data(peoples_m, books_m)
    puts 'Select a book from the following list by number: '
    books_m.list_all_books
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (Not ID): '
    peoples_m.list_all_people
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    [date, book_index, person_index]
  end

  def list_rentals_by_person_id
    id, rentals = rentals_by_id

    if rentals.empty?
      puts 'This person has no rentals'
    else
      puts "Rentals for person with ID #{id}:"
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def rentals_by_id
    print 'ID of the person: '
    id = gets.chomp.to_i

    rentals = @rentals.select do |rental|
      rental.person.id.to_i == id
    end

    [id, rentals]
  end
end
