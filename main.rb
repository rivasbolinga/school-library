require_relative 'book_class'
require_relative 'person_class'
require_relative 'rental_class'

# Create books
book1 = Book.new(1, "Book 1")
book2 = Book.new(2, "Book 2")

# Create persons
person1 = Person.new(1, "John")
person2 = Person.new(2, "Jane")

# Create rentals and establish relationships
rental1 = Rental.new("2017-12-22", book1, person1)
rental2 = Rental.new("2017-12-31", book1, person2)
rental3 = Rental.new("2018-12-31", book2, person1)

puts book2.rentals.map { |rental| rental.date }
puts book1.rentals.map  { |rental| rental.date }