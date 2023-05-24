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

end

end