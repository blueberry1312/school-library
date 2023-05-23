require_relative 'student'
require_relative 'teacher'
require_relative 'general_m'
require_relative 'user_input'
require 'json'

class PeopleMethod < GeneralMethod
  attr_accessor :people

  def initialize
    super
    @people = []
    load_people_from_json
  end

  def list_all_people
    check_empty_list(@people, 'people')

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    inputs = user_input(%w[Age Name])
    Student.new(inputs[0], inputs[1])
  end

  def create_teacher
    inputs = user_input(%w[Age Name Specialization])
    Teacher.new(inputs[0], inputs[2], inputs[1])
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

  def save_people_to_json
    data = @people.map(&:to_h)
    File.write('people.json', JSON.generate(data))
  end

  def load_people_from_json
    if File.exist?('people.json')
      file = File.read('people.json')
      data = JSON.parse(file)
      @people = data.map { |person_data| create_person_from_data(person_data) }
    else
      puts 'No people data found.'
    end
  end

  def create_person_from_data(data)
    if data['type'] == 'student'
      Student.new(data['age'], data['name'], data['id'])
    elsif data['type'] == 'teacher'
      Teacher.new(data['age'], data['specialization'], data['name'], data['id'])
    else
      puts 'Invalid person type found in JSON data.'
    end
  end
end
