require_relative('spec_helper')

RSpec.describe GeneralMethod do
  let(:general_method) { described_class.new }

  describe '#check_empty_list' do
    context 'when the list is empty' do
      it 'prints a message indicating the empty list' do
        list = []
        list_name = 'books'
        expected_message = "There's no #{list_name} stored yet\n"

        expect { general_method.check_empty_list(list, list_name) }.to output(expected_message).to_stdout
      end
    end

    context 'when the list is not empty' do
      it 'does not print any message' do
        list = [1, 2, 3]
        list_name = 'books'

        expect { general_method.check_empty_list(list, list_name) }.not_to output.to_stdout
      end
    end
  end
end
