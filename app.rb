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
  if @books.length == 0
    puts "The list of books is empty"
  else
  @books.each { | book| puts "Title: #{book.title}, Author: #{book.author}" }
  end
end

def list_all_people
  if @people.length == 0
    puts "The list of people is empty"
  else
  @people.each { | person| puts "[#{person.class}]ID:#{person.id}, Name: #{person.name}, Age:#{person.age}" }
  end
end

def create_person
  puts "Do you want to create a student(1) or a teacher(2)? [input the number]:"
  input = gets.chomp
  if input == '1'
    create_student()
  elsif input == '2'
    create_teacher()
  else
    puts "Please select one of the options"
  end

end

def create_student
  puts "You have selected create a student, please insert the following"
  print "Age: "
  age = gets.chomp
  print "\nName: "
  name = gets.chomp
  print "Has parent permission?[Y/N]:"
  parent_permission = gets.chomp.downcase == 'y'
  print "What is the classroom of the student?:"
  classroom = gets.chomp
  new_student = Student.new(age,name,parent_permission, classroom)
  puts "#{name} as student, has been created succesfully!"
  @people.push(new_student)
end

def create_teacher
  puts "You have selected create a teacher, please insert the following"
  puts "Age:"
  age = gets.chomp
  puts "Name:"
  name = gets.chomp
  puts "What does he/she teach?"
  specialization = gets.chomp
  new_teacher = Teacher.new(age,name, specialization)
  puts "#{name} as teacher, has been created succesfully!"
  @people.push(new_teacher)
end
def create_book
  puts "You have selected create a book, please insert the following"
  puts "Title: "
  title = gets.chomp
  puts "Author:"
  author = gets.chomp
  new_book = Book.new(title, author)
  @books.push(new_book)
  puts "#{title} has been created succesfully!"
end

def create_rental
  if @books.length == 0
    puts "Sorry, there are not books to be rented"
  elsif @people.length == 0
    puts "Sorry, there are not people to rent"
  else
    puts 'Chose a book from the list:'
     @books.each_with_index { |book, index| puts "#{index + 1}) #{book.title}, #{book.author}" }
     book_selected = gets.chomp.to_i - 1
    puts 'Chose a person from the list:'
    @people.each_with_index { |person, index| puts "#{index + 1}) #{person.name}, #{person.class}" }
     person_selected = gets.chomp.to_i - 1
  if book_selected >= 0 && book_selected < @books.length && person_selected >= 0 && person_selected < @people.length
        print 'What day was rented? [dd-mm-yyyy]'
        date = gets.chomp
        new_rental = Rental.new(date, @people[person_selected], @books[book_selected])
     @rentals.push(new_rental)
     puts "Rental created successfully!"
  else 
    puts 'Sorry, invalid person or book selecter, try again'
  end
  end
end

def list_rentals_by_id
    print "Please insert ID:"
    id = gets.chomp.to_i

    person = @people.find { |p| p.id == id }
    if person
      if person.rentals.empty?
        puts "No rentals found for this person."
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
  case option
  when '1'
    list_all_books()
  when '2'
    list_all_people()
  when '3'
    create_person()
  when '4'
    create_book()
  when '5'
    create_rental()
  when '6'
    list_rentals_by_id()
  when '7'
    exit_app()
  else
    puts 'You have to select one of the options'
  end
end


def run
  loop do
    options()
    option = gets.chomp
    apply_option(option)
  end
end



end

