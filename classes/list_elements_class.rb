class ListElements
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @convert_data = DataStorage.new
  end

  def list_all_books
    retrieved_books = @convert_data.load_data('data/books.json')
    if retrieved_books.empty?
      puts 'Not books found'
    else
      retrieved_books.each { |book| puts " Title: #{book['title']}, Author: #{book['author']}" }
    end
  end

  def list_all_people
    retrieved_people = @convert_data.load_data('data/people.json')
    if retrieved_people.empty?
      puts 'Not people found'
    else
      retrieved_people.each { |person| puts "[#{person['id']}], #{person['type']} Name: #{person['name']}, Age:#{person['age']}" }
    end
  end

  def list_all_rentals
    retrieved_rentals = @convert_data.load_data('data/rentals.json')
  end

  def list_rentals_by_id
    print 'PLease insert ID from one of the following:'
    people = list_all_people
    rentals = list_all_rentals
    id = gets.chomp.to_i
    person = people.find { |p| p['id'].to_i == id }
    puts person
    puts rentals
    if person
      if rentals.empty?
        puts 'No rentals found for this person.'
      else
        puts "Rentals for #{person['name']}:"
  
       rentals.each { |rental| puts "[#{rental['date']}]" }
      end
    else
      puts "Person with ID #{id} not found."
    end
  end
end
