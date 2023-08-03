class ListElements
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @load_data = DataStorage.new
    @convert_data = ConvertData.new
  end

  def list_all_books
    all_books = @convert_data.unificate_books(@books)
    if all_books.empty?
      puts 'No books found'
    else
      puts '📖 List of books:'
      puts '-----------------'
      all_books.each { |book| puts " Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    all_people = @convert_data.unificate_person(@people)
    if all_people.empty?
      puts 'Not people found'
    else
      puts 'List of people:'
      puts '-------------------'
      all_people.each { |person| puts "[#{person.id}] Name: #{person.name}, Age:#{person.age}" }
    end
  end

  def list_rentals_by_id
    all_rentals = @convert_data.unificate_rentals(@rentals)
    list_all_people
    puts 'Please insert ID from one of the following:'
    id = gets.chomp.to_i
    rentals_with_id = all_rentals.select { |rental| rental['id'].to_i == id }

    if rentals_with_id.empty?
      puts "No rentals found with ID: #{id}"
    else
      puts "Rentals for person with ID: #{id}"
      puts '--------------------------'
      rentals_with_id.each do |rental|
        puts "Date: #{rental['date']}, Book: #{rental['book']}, Person: #{rental['person']}"
      end
    end
  end
end
