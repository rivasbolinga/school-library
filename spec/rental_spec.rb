require 'rspec'
require_relative '../classes/rental_class'
require_relative '../classes/person_class'
require_relative '../classes/book_class'

describe Rental do
  before(:each) do
    @person = Person.new(333, 'Andrea', 28)
    @book = Book.new('New Title', 'New Book')
    @rental = Rental.new('02-02-2000', @person, @book, 1)
  end

  context 'Create a new rental' do
    it 'adds a new rental' do
      expect(@rental.date).to eq('02-02-2000')
      expect(@rental.person).to eq(@person)
      expect(@rental.book).to eq(@book)
      expect(@rental.id).to eq(1)
    end

    it 'generates an ID randomly if ID is not provided' do
      rental = Rental.new('02-02-2000', @person, @book, nil)

      expect(rental.id).to be_a(Integer)
    end
  end

  context 'Generate ID' do
    it 'generates a random ID between 1 and 1000' do
      rental = Rental.new('02-02-2000', @person, @book, nil)

      expect(rental.send(:generate_id)).to be >= 1
      expect(rental.send(:generate_id)).to be <= 1000
    end
  end

  context 'Check rental in other classess' do
    it 'adds the rental to the person rentals' do
      expect(@person.rentals).to include(@rental)
    end

    it 'adds the rental to the book rentals' do
      expect(@book.rentals).to include(@rental)
    end
  end
end
