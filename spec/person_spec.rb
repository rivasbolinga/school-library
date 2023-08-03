require 'rspec'
require_relative '../classes/book_class'
require_relative '../classes/rental_class'
require_relative '../classes/person_class'

describe Person do
  before(:each) do
    @person = Person.new(333, 'Andrea', 28)
  end

  context 'Create a new person' do
    it 'add name, age and id' do
      person = Person.new(333, 'Andrea', 28)
      expect(person.id).to eq(333)
      expect(person.name).to eq('Andrea')
      expect(person.age).to eq(28)
    end
    it 'Generates a random id' do
      person = Person.new(333, 'Andrea', 28)
      expect(person.id).to be_a(Integer)
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

  context 'Convert data to a hash' do
    it 'converts data to a hash' do
      expected_hash = {
        id: 333,
        name: 'Andrea',
        age: 28,
        parent_permission: true,
        type: 'Person'
      }

      expect(@person.to_hash).to eq(expected_hash)
    end
  end

  context 'Correct name' do
    it 'returns the correct name' do
      person = Person.new(333, 'Andrea', 28)
      expect(person.correct_name).to eq('Andrea')
    end
  end

  context 'Check if person is of age' do
    it 'returns true for a person of age' do
      person = Person.new(123, 'Andrea', 28)
      expect(person.send(:of_age?)).to be(true)
    end

    it 'returns false for a person below the age of 18' do
      person = Person.new(234, 'Antonio', 10)
      expect(person.send(:of_age?)).to be(false)
    end
  end

  context 'Check if person can use sevices' do
    it 'returns true if person is older' do
      person = Person.new(123, 'Andrea', 28)
      expect(person.send(:can_use_services?)).to be(true)
    end

    it 'returns false when person in under age and does not have parents persmission' do
      person = Person.new(234, 'Antonio', 10, parent_permission: false)
      expect(person.send(:can_use_services?)).to be(false)
    end
    it 'returns true when person in under age but has parents persmission' do
      person = Person.new(234, 'Antonio', 10, parent_permission: true)
      expect(person.send(:can_use_services?)).to be(true)
    end
  end
end
