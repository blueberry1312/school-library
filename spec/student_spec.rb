require_relative('spec_helper')

RSpec.describe Student do
  let(:student) { described_class.new(18, 'John Doe', 1) }

  describe '#initialize' do
    it 'inherits age, name, and id from Person' do
      expect(student.age).to eq(18)
      expect(student.name).to eq('John Doe')
      expect(student.id).to eq(1)
    end

    it 'sets classroom to nil' do
      expect(student.classroom).to be_nil
    end
  end

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#add_classroom' do
    let(:classroom) { double('Classroom', students: []) }

    it 'assigns the classroom to the student' do
      student.add_classroom(classroom)
      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to the classroom' do
      student.add_classroom(classroom)
      expect(classroom.students).to contain_exactly(student)
    end

    it 'does not add the student to the classroom if already present' do
      classroom.students << student
      student.add_classroom(classroom)
      expect(classroom.students.count(student)).to eq(1)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the student' do
      expect(student.to_h).to eq({
                                   'type' => 'student',
                                   'id' => 1,
                                   'age' => 18,
                                   'name' => 'John Doe'
                                 })
    end
  end

  describe '#to_s' do
    it 'returns the name of the student' do
      expect(student.to_s).to eq('John Doe')
    end
  end
end
