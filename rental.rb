class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_s
    "#{@book}, Rented by #{@person}"
  end
end
