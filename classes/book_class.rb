require_relative 'rental_class'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end
end
