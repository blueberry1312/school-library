require_relative('spec_helper')

RSpec.describe Person do
  let(:person) { described_class.new(20, 'John Doe', 1) }

  describe '#initialize' do
    it 'sets the age' do
      expect(person.age).to eq(20)
    end

    it 'sets the name' do
      expect(person.name).to eq('John Doe')
    end

    it 'generates a random ID if none is provided' do
      expect(person.id).not_to be_nil
    end

    it 'sets the ID if provided' do
      person_with_id = described_class.new(25, 'Jane Smith', 123)
      expect(person_with_id.id).to eq(123)
    end

    it 'sets parent permission to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end

    it 'initializes an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 or older' do
      expect(person.of_age?).to be true
    end

    it 'returns false if the person is younger than 18' do
      underage_person = described_class.new(15, 'Jane Smith', 2)
      expect(underage_person.of_age?).to be false
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to be true
    end

    it 'returns true if the person has parent permission' do
      person_with_permission = described_class.new(16, 'Jane Smith', 3, parent_permission: true)
      expect(person_with_permission.can_use_services?).to be true
    end

    it 'returns false if the person is underage and has no parent permission' do
      underage_person = described_class.new(15, 'Jane Smith', 4, parent_permission: false)
      expect(underage_person.can_use_services?).to be false
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#to_s' do
    it 'returns the name of the person' do
      expect(person.to_s).to eq('John Doe')
    end
  end
end
