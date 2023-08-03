require 'rspec'
require_relative '../classes/book_class'
require_relative '../classes/rental_class'
require_relative '../classes/person_class'

describe Person do
  before(:each) do
    @person = Person.new(333, 'Andrea', '28')
  end

  context 'Create a new person' do
    it 'add name, age and id' do
      expect(@person.id).to eq(333)
      expect(@persom.name).to eq('Andrea')
      expect(@person.age).to eq('28')
    end
  end

  context 'Add rentals to the person' do
    it 'has an empty rentals array initially' do
      expect(@person.rentals).to be_empty
    end

    it 'can add a rental' do
      book = Book.new('New book', 'new Author')
      rental = Rental.new('2023-08-03', @person, book, 1)
      @person.add_rental(rental)
      expect(@person.rentals).to include(rental)
    end

  end

  # context 'Convert to a hash' do
  #   it 'converts to a hash' do
  #     expected_hash = {
  #       title: 'New Title',
  #       author: 'New Book'
  #     }

  #     expect(@person.to_hash).to eq(expected_hash)
  #   end
  # end
end
