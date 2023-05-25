require_relative('spec_helper')

RSpec.describe Teacher do
  let(:teacher) { described_class.new(30, 'Mathematics', 'Jane Smith', 1) }

  describe '#initialize' do
    it 'inherits age, name, and id from Person' do
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Jane Smith')
      expect(teacher.id).to eq(1)
    end

    it 'sets the specialization' do
      expect(teacher.instance_variable_get(:@specialization)).to eq('Mathematics')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the teacher' do
      expect(teacher.to_h).to eq({
                                   'type' => 'teacher',
                                   'id' => 1,
                                   'age' => 30,
                                   'name' => 'Jane Smith',
                                   'specialization' => 'Mathematics'
                                 })
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teachers' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
