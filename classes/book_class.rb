require_relative 'rental_class'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end

  def to_hash
    {
      title: @title,
      author: @author
    }
  end
end
