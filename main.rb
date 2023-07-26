require_relative 'classes/book_class'
require_relative 'classes/person_class'
require_relative 'classes/rental_class'

# Create books
book1 = Book.new(1, 'Book 1')
book2 = Book.new(2, 'Book 2')
book3 = Book.new(3, 'Book 3')

# Create persons
person1 = Person.new('John')
person2 = Person.new('Jane')
person3 = Person.new('Ana')

# Create rentals and establish relationships
Rental.new('2017-12-22', book1, person1)
Rental.new('2017-12-31', book1, person2)
Rental.new('2018-12-31', book2, person1)
Rental.new('2022-10-22', book3, person3)

puts book2.rentals.map(&:date)
puts book1.rentals.map(&:date)
puts person1.rentals.count
puts person3.rentals.count
