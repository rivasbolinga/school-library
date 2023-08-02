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
    retrieved_rentals = @convert_data.unificate_rentals(@rentals)
  end

  # def list_rentals_by_id
  # list_all_people
  # puts 'Please insert ID from one of the following:'
  # id = gets.chomp.to_i
  # all_people = @convert_data.unificate_person(@people)
  # person = all_people.find { |p| p.id == id }
  # retrieved_rentals = @load_data.load_data('data/rentals.json')
  # rental_for_person = retrieved_rentals.find { |p| p.id_of_person == id }
  #   puts rental_for_person
  #   people = list_all_people
  # rentals = list_all_rentals
  # person = people.find { |p| p['id'] == id }

  # if person
  #   rentals_for_person = rentals.select { |rental| rental['person']['id'] == id }
    
  #   if rentals_for_person.empty?
  #     puts 'No rentals found for this person.'
  #   else
  #     puts "Rentals for #{person['name']}:"

  #     rentals_for_person.each do |rental|
  #       book_name = rental['book']['title']
  #       rental_date = rental['date']
  #       puts "Date: #{rental_date}, Book: #{book_name}"
  #     end
  #   end
  # else
  #   puts "Person with ID #{id} not found."
  # end
# end

end
