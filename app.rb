require_relative 'classes/student_class'
require_relative 'classes/teacher_class'
require_relative 'classes/rental_class'
require_relative 'classes/ui_class'
require_relative 'classes/list_elements_class'
require_relative 'classes/create_elements_class'
require_relative 'classes/data_manager_class'
require_relative 'classes/convert_data'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @list_elements = ListElements.new(@books, @people, @rentals)
    @creale_elements = CreateElements.new(@books, @people, @rentals)
    @data_storage = DataStorage.new
    @convert_data = ConvertData.new
  end

  def apply_option(option)
    actions = {
      '1' => @list_elements.method(:list_all_books),
      '2' => @list_elements.method(:list_all_people),
      '3' => @creale_elements.method(:create_person),
      '4' => @creale_elements.method(:create_book),
      '5' => @creale_elements.method(:create_rental),
      '6' => @list_elements.method(:list_rentals_by_id),
      '7' => method(:exit_app)
    }
    action = actions[option]
    if action
      action.call
    else
      puts 'You have to select one of the options'
    end
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    if File.exist?('data/books.json')
      data = JSON.parse(File.read('data/books.json'))
      @books = data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
    else
      puts 'No books data file found. Starting with an empty book list.'
      @books = []
    end
  end

  def load_people
    if File.exist?('data/people.json')
      data = JSON.parse(File.read('data/people.json'))
      @people = data.map do |person_data|
        if person_data['type'] == 'Student'
          Student.new(person_data['age'], person_data['name'], true, person_data['classroom'])
        else
          Teacher.new(person_data['age'], person_data['name'], person_data['specialization'])
        end
      end
    else
      puts 'No people data file found. Starting with an empty people list.'
      @people = []
    end
  end

  def load_rentals
    if File.exist?('data/rentals.json')
      data = JSON.parse(File.read('data/rentals.json'))
      @rentals = data.map do |rental_data|
        book = @books.find { |book| book.title == rental_data['book']['title'] && book.author == rental_data['book']['author'] }
        person = @people.find { |person| person.name == rental_data['person']['name'] }

        Rental.new(rental_data['date'], person, book) if book && person
      end.compact
    else
      puts 'No rentals data file found. Starting with an empty rentals list.'
      @rentals = []
    end
  end

  def save_data
    books_data = @books.map { |book| @convert_data.convert_book(book) }
    people_data = @people.map { |person| @convert_data.convert_person(person) }
    rentals_data = @rentals.map { |rental| @convert_data.convert_rentals(rental) }

    @data_storage.create_data_saver('data/books.json', books_data)
    @data_storage.create_data_saver('data/people.json', people_data)
    @data_storage.create_data_saver('data/rentals.json', rentals_data)
  end

  def convert_data_in_json
    @convert_data.convert_book(@books)
    @convert_data.convert_person(@people)
  end

  def run
    ui = UI.new
    ui.welcome
    loop do
      ui.options
      option = gets.chomp
      apply_option(option)
    end
  end

  def exit_app
    save_data
    puts 'Exiting the application. Goodbye!'
    exit
  end
end
