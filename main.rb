require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom_a = Classroom.new('A')
classroom_b = Classroom.new('B')

student = Student.new(44, classroom_a, 'maximilianus')
book = Book.new('Harry Potter and the Philosophers Stone', 'J. K. Rowling')
puts classroom_a.students
puts student.classroom
puts student.add_classroom(classroom_b)
puts classroom_b.students

rental = Rental.new(Time.now, book, person)
puts rental
