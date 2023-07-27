require_relative 'classes/student_class'
require_relative 'classes/teacher_class'
require_relative 'classes/rental_class'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def options
    puts 'Please choose one of the following options:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_books
    if @books.empty?
      puts 'The list of books is empty'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'The list of people is empty'
    else
      @people.each { |person| puts "[#{person.class}]ID:#{person.id}, Name: #{person.name}, Age:#{person.age}" }
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [input the number]:'
    input = gets.chomp
    if input == '1'
      create_student
    elsif input == '2'
      create_teacher
    else
      puts 'Please select one of the options'
    end
  end

  def create_student
    puts 'You have selected create a student, please insert the following'
    print 'Age: '
    age = gets.chomp
    print "\nName: "
    name = gets.chomp
    print 'Has parent permission?[Y/N]:'
    parent_permission = gets.chomp.downcase == 'y'
    print 'What is the classroom of the student?:'
    classroom = gets.chomp
    new_student = Student.new(age, name, parent_permission, classroom)
    puts "#{name} as student, has been created succesfully!"
    @people.push(new_student)
  end

  def create_teacher
    puts 'You have selected create a teacher, please insert the following'
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'What does he/she teach?'
    specialization = gets.chomp
    new_teacher = Teacher.new(age, name, specialization)
    puts "#{name} as teacher, has been created succesfully!"
    @people.push(new_teacher)
  end

  def create_book
    puts 'You have selected create a book, please insert the following'
    puts 'Title: '
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "#{title} has been created succesfully!"
  end

  def create_rental
    return puts 'Sorry, there are no books to be rented' if @books.empty?
    return puts 'Sorry, there are no people to rent' if @people.empty?

    puts 'Choose a book from the list:'
    list_all_books

    @books.each_with_index { |book, index| puts "#{index + 1}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
    book_selected = gets.chomp.to_i - 1

    puts 'Select a person:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}"
    end
    person_selected = gets.chomp.to_i - 1

    print 'What day was rented? [dd-mm-yyyy]'
    date = gets.chomp

    new_rental = Rental.new(date, @people[person_selected], @books[book_selected])
    @rentals.push(new_rental)
    puts 'Rental created successfully!'
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

  def exit_app
    puts 'Exiting the application. Goodbye!'
    exit
  end

  def apply_option(option)
    actions = {
      '1' => method(:list_all_books),
      '2' => method(:list_all_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => method(:list_rentals_by_id),
      '7' => method(:exit_app)
    }

    action = actions[option]
    if action
      action.call
    else
      puts 'You have to select one of the options'
    end
  end

  def run
    loop do
      options
      option = gets.chomp
      apply_option(option)
    end
  end
end
