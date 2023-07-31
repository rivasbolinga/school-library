require_relative 'person_class'
require_relative 'book_class'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, _person, book)
    @date = date
    @book = book
    book.rentals << self
  end
end
