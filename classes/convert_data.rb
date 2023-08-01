class ConvertData
  def initialize
    @rentals_data = []
  end

  def convert_book(book)
    book.to_hash
  end

  def convert_person(person)
    person.to_hash
  end

  def convert_rentals(rentals)
    book_object = convert_book(rentals.book)
    person_object = convert_person(rentals.person)
    rental_data = {
      date: rentals.date,
      book: book_object[:title],
      person: person_object[:name]
    }
    @rentals_data << rental_data
  end

  attr_reader :rentals_data
end
