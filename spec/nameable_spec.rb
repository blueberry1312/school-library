require_relative('spec_helper')

RSpec.describe Nameable do
  let(:nameable) { described_class.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
