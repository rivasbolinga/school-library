require_relative 'classes/student_class'

class App
  def initialize()
    @people = []
    @books = []
    @rentals = []
  end


def list_all_books
  @books.each { | book| puts " #{book}" }

end

def list_all_people
  @people.each { | person| puts "#{person}" }
end

def create_a_person
  puts "Do you want to create a student(1) or a teacher(2)? [input the number]:"
  input = gets.chomp
  if input = 1
    create_student()
  elsif input = 2
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
  puts "#{name} Student created succesfully!"
  @people.push(new_student)
end

def create_teacher
end

end

