require_relative 'person_class'
require_relative 'book_class'

class Rental
  attr_accessor :date, :person, :book, :person_id

  def initialize(date, person, book, person_id)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @person_id = person_id
  end
end
