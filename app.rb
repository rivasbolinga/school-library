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
