require 'rspec'
require_relative '../classes/book_class'
require_relative '../classes/rental_class'
require_relative '../classes/person_class'

describe Book do
  before(:each) do
    @book = Book.new('New Title', 'New Book')
  end

  context 'Create a new book' do
    it 'add title and author' do
      expect(@book.title).to eq('New Title')
      expect(@book.author).to eq('New Book')
    end
  end

  context 'Add rentals to the book' do
    it 'has an empty rentals array initially' do
      expect(@book.rentals).to be_empty
    end

    it 'can add a rental' do
      alice = Person.new('Alice')
      rental = Rental.new('2023-08-03', alice, @book, 1)
      @book.add_rental(rental)

      expect(@book.rentals).to include(rental)
    end
  end

  context 'Convert to a hash' do
    it 'converts to a hash' do
      expected_hash = {
        title: 'New Title',
        author: 'New Book'
      }

      expect(@book.to_hash).to eq(expected_hash)
    end
  end
end
