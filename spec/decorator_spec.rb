require_relative('spec_helper')

RSpec.describe Decorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name method on the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
