require_relative('spec_helper')

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the original name is longer than 10 characters' do
      it 'calls correct_name method on the nameable object and returns the first 10 characters' do
        expect(nameable).to receive(:correct_name).and_return('John Doe Smith')
        expect(decorator.correct_name).to eq('John Doe S')
      end
    end

    context 'when the original name is shorter than or equal to 10 characters' do
      it 'calls correct_name method on the nameable object and returns the original name' do
        expect(nameable).to receive(:correct_name).and_return('John Doe')
        expect(decorator.correct_name).to eq('John Doe')

        expect(nameable).to receive(:correct_name).and_return('John')
        expect(decorator.correct_name).to eq('John')
      end
    end
  end
end
