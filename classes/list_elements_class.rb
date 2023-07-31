class ListElements
  def initialize(books, people)
    @books = books
    @people = people
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
end
