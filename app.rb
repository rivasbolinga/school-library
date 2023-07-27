require_relative 'classes/student_class'
require_relative 'classes/teacher_class'

class App
  def initialize()
    @people = []
    @books = []
    @rentals = []
  end


def list_all_books
  @books.each { | book| puts "Title: #{book.title}, Author: #{book.author}" }
end

def list_all_people
  @people.each { | person| puts "#{person}" }
end

def create_a_person
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
  puts "Age:"
  age = gets.chomp
  puts "Name:"
  name = gets.chomp
  puts "Has parent permission?[Y/N]:"
  parent_permission = gets.chomp.downcase == 'y'
  puts "What is the classroom of the student?:"
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

end

