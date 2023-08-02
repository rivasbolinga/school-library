class ConvertData
  def initialize
    @rentals_data = []
    @load_data = DataStorage.new
  end

  def convert_book(book)
    book.to_hash
  end

  def convert_person(person)
    person.to_hash
  end

 
def unificate_books(books)
    retrieved_books = @load_data.load_data('data/books.json')
    books_in_app = books.map { |book| { 'title' => book.title, 'author' => book.author, 'object' => book } }
    all_books_data = (books_in_app + retrieved_books).uniq { |book| book['title'] }
    all_books_data.map do |book_data|
      book_object = book_data['object']
      if book_object.nil?
        Book.new(book_data['title'], book_data['author'])
      else
        book_object
      end
    end
  end

  def unificate_person(person)
    retrieved_people = @load_data.load_data('data/people.json')
    people_in_app = person.map {| person | { 'name' => person.name, 'type' => person.class, 'age' => person.age, 'id'=> person.id } }
    all_people = (people_in_app + retrieved_people).uniq { |person| person['name'] }
    all_people.map do | person_data |
      people_object = person_data['object']
      if people_object.nil?
        Person.new(person_data['id'], person_data['age'], person_data['name'])
      else
        people_object
      end
    end
  end

    def unificate_rentals(rentals_data)
    retrieved_rentals = @load_data.load_data('data/rentals.json')
    rentals_in_app = rentals_data.map do |rental|
      {
        'date' => rental.date,
        'person' => rental.person.name,
        'book' => rental.book.title,  
        'id' => rental.id              
      }
    end

    all_rentals_data = (rentals_in_app + retrieved_rentals)

    all_rentals_data.map do |rental_data|
      rental_object = rental_data['object']
      if rental_object.nil?
        # Create a new rental object using the data from the hash
        new_rental = Rental.new(
          rental_data['date'],
          rental_data['person'],
          rental_data['book'],
          rental_data['id']
        )
      else
        # Use the existing rental object from the app
        rental_object
      end
    end
  end


  def convert_rentals(rentals)
    book_object = convert_book(rentals.book)
    person_object = convert_person(rentals.person)
    rental_data = {
      date: rentals.date,
      book: book_object[:title],
      person: person_object[:name],
      id_of_person: person_object[:id]
    }
    @rentals_data << rental_data
  end

  attr_reader :rentals_data
end
