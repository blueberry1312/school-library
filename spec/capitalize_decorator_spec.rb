require_relative('spec_helper')

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name method on the nameable object and capitalizes the result' do
      expect(nameable).to receive(:correct_name).and_return('john doe')
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
