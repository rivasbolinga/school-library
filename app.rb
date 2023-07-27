

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
  @people.each { | book| puts " #{book}" }
end

def create_a_person
  puts "Do you want to create a student(1) or a teacher(2)? [input the number]:"
  input = gets.chomp
  
end

end

