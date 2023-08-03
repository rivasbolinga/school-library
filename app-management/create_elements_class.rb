require_relative 'list_elements_class'

class CreateElements
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @list_elements = ListElements.new(@books, @people, @rentals)
    @unificate_data = ConvertData.new
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
    age, name = common_person_inputs
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'What is the classroom of the student?: '
    classroom = gets.chomp
    new_student = Student.new(age, name, parent_permission, classroom)
    puts "🟢🟢 #{name} as student has been created successfully!"
    @people.push(new_student)
  end

  def create_teacher
    puts 'You have selected create a teacher, please insert the following'
    age, name = common_person_inputs
    print 'What does he/she teach? '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, name, specialization)
    puts "🟢🟢 #{name} as teacher has been created successfully!"
    @people.push(new_teacher)
  end

  def common_person_inputs
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    [age, name]
  end

  def create_book
    puts 'You have selected create a book, please insert the following'
    puts 'Title: '
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "🟢🟢 #{title} has been created succesfully!"
  end

  def create_rental
    all_books = @unificate_data.unificate_books(@books)
    all_people = @unificate_data.unificate_person(@people)

    puts 'Please choose a book:'
    all_books.each_with_index { |book, index| puts "[#{index + 1}]: Title: #{book.title}, Author: #{book.author}" }
    print 'Please enter the index of the book you want to collect: '
    book_chosen = gets.chomp.to_i

    puts 'Please choose a person:'
    all_people.each_with_index do |person, index|
      puts "[#{index + 1}]: ID: #{person.id} Name: #{person.name}, Profession: #{person.class}"
    end
    print 'Please enter the index of the person: '
    person_chosen = gets.chomp.to_i

    book_to_collect = all_books[book_chosen - 1]
    person_to_collect = all_people[person_chosen - 1]

    print 'What day was rented? [dd-mm-yyyy]: '
    date = gets.chomp

    new_rental = Rental.new(date, person_to_collect, book_to_collect, person_to_collect.id)
    @rentals.push(new_rental)
    puts '🟢🟢 Rental created successfully!'
  end
end
