require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', id = nil)
    super(age, name, id)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_h
    {
      'type' => 'student',
      'id' => @id,
      'age' => @age,
      'name' => @name
    }
  end

  def to_s
    @name
  end
end
