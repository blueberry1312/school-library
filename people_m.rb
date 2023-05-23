require_relative 'student'
require_relative 'teacher'
require_relative 'general_m'

class PeopleMethod < GeneralMethod
  attr_accessor :people

  def initialize
    super
    @people = []
  end

  def list_all_people
    check_empty_list(@people, 'people')

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    age, name = student_d
    Student.new(age, name)
  end

  def student_d
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    [age, name]
  end

  def create_teacher
    age, name, specialization = teacher_d
    Teacher.new(age, specialization, name)
  end

  def teacher_d
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    [age, name, specialization]
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp

    case input
    when '1'
      new_student = create_student
      @people << new_student
      puts 'New person (Student) created successfully'
    when '2'
      new_teacher = create_teacher
      @people << new_teacher
      puts 'New person (Teacher) created successfully'
    else
      puts 'Please enter a valid number (1 or 2)'
      create_person
    end
  end
end
