class ListElements
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def list_all_books
    if @books.empty?
      puts 'Not books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Not people found'
    else
      @people.each { |person| puts "[#{person.class}]ID:#{person.id}, Name: #{person.name}, Age:#{person.age}" }
    end
  end

  def list_rentals_by_id
    print 'Please insert ID:'
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    if person
      if person.rentals.empty?
        puts 'No rentals found for this person.'
      else
        puts "Rentals for #{person.name}:"
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
        end
      end
    else
      puts "Person with ID #{id} not found."
    end
  end
end
