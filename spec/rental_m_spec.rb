require_relative('spec_helper')

RSpec.describe RentalMethod do
  let(:rental_method) { described_class.new }

  describe '#create_rental' do
    let(:peoples_m) { instance_double('PeoplesMethod') }
    let(:books_m) { instance_double('BooksMethod') }
    let(:book) { instance_double('Book') }
    let(:person) { instance_double('Person') }

    before do
      allow(rental_method).to receive(:user_input).and_return(['2023-05-24'])
      allow(rental_method).to receive(:select_book).and_return(0)
      allow(rental_method).to receive(:select_person).and_return(0)
      allow(books_m).to receive(:instance_variable_get).with(:@books).and_return([book])
      allow(peoples_m).to receive(:people).and_return([person])
      allow(books_m).to receive(:list_all_books)
      allow(peoples_m).to receive(:list_all_people)
      allow(rental_method).to receive(:save_rentals_to_json)
      allow($stdout).to receive(:puts)
    end

    it 'creates a new rental and saves it to JSON file' do
      expect(Rental).to receive(:new).with('2023-05-24', book, person)
      rental_method.create_rental(peoples_m, books_m)
      expect(rental_method).to have_received(:save_rentals_to_json)
      expect($stdout).to have_received(:puts).with('Rental created successfully')
    end
  end

  describe '#list_rentals_by_person_id' do
    let(:person_id) { '123' }
    let(:rental) { instance_double('Rental', date: '2023-05-24', book: 'Book') }
    let(:book) { instance_double('Book', title: 'Book Title', author: 'Book Author') }

    before do
      allow(rental_method).to receive(:user_input).and_return([person_id])
      allow(rental_method).to receive(:rentals_by_id).and_return([person_id, [rental]])
      allow($stdout).to receive(:puts)
    end

    context 'when no rentals exist for the person' do
      before do
        allow(rental_method).to receive(:rentals_by_id).and_return([person_id, []])
      end

      it 'prints a message indicating no rentals' do
        rental_method.list_rentals_by_person_id
        expect(rental_method).to have_received(:rentals_by_id)
        expect($stdout).to have_received(:puts).with('This person has no rentals')
      end
    end
  end
end
