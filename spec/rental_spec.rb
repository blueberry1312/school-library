require_relative('spec_helper')

RSpec.describe Rental do
  let(:date) { double('Date') }
  let(:book) { double('Book') }
  let(:person) { double('Person') }
  let(:rental) { described_class.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date' do
      expect(rental.date).to eq(date)
    end

    it 'sets the book' do
      expect(rental.book).to eq(book)
    end

    it 'sets the person' do
      expect(rental.person).to eq(person)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the rental' do
      allow(book).to receive(:to_s).and_return('Book 1')
      allow(person).to receive(:to_s).and_return('John Doe')
      expect(rental.to_s).to eq('Book 1, Rented by John Doe')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      allow(book).to receive(:to_h).and_return({ 'id' => 1, 'title' => 'Book 1' })
      allow(person).to receive(:to_h).and_return({ 'id' => 1, 'name' => 'John Doe' })
      expect(rental.to_h).to eq({
                                  'date' => date,
                                  'book' => { 'id' => 1, 'title' => 'Book 1' },
                                  'person' => { 'id' => 1, 'name' => 'John Doe' }
                                })
    end
  end
end
