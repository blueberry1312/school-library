require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', id = nil)
    super(age, name, id)
    @specialization = specialization
  end

  def to_h
    {
      'type' => 'teacher',
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization
    }
  end

  def can_use_services?
    true
  end
end
