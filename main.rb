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
rental1 = Rental.new(101, book1, person1)
rental2 = Rental.new(102, book1, person2)
rental3 = Rental.new(103, book2, person1)

# Accessing the rentals from a book or person
puts book1.rentals # List of rentals for Book 1
puts person1.rentals  # List of rentals for Person John
