require_relative 'menu_m'
require_relative 'book_m'
require_relative 'people_m'
require_relative 'rental_m'

class App
  def initialize
    @people_m = PeopleMethod.new
    @books_m = BookMethod.new
    @rentals_m = RentalMethod.new
    @menu = Menu.new(self)
  end

  def start
    @menu.display_menu
  end

  def list_all_people
    @people_m.list_all_people
    start
  end

  def create_person
    @people_m.create_person
    start
  end

  def list_all_books
    @books_m.list_all_books
    start
  end

  def create_book
    @books_m.create_book
    start
  end

  def create_rental
    @rentals_m.create_rental(@people_m, @books_m)
    start
  end

  def list_rentals_by_person_id
    @rentals_m.list_rentals_by_person_id
    start
  end
end
