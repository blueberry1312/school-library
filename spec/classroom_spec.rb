require_relative('spec_helper')

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
  end

  describe '#new' do
    it 'takes two parameters and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eql 'Math'
    end
  end

  describe '#students' do
  it 'returns an empty array when no students are added' do
    expect(@classroom.students).to eql []
  end
end

end