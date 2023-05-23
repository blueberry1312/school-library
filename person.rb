require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name, id, parent_permission: true)
    @age = age
    @name = name
    @id = id || generate_random_id
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  private

  def generate_random_id
    Random.rand(1..1000)
  end

  public

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def to_s
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
