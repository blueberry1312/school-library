require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name)
    super(age, name)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_s
    @name
  end
end
