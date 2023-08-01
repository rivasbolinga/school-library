require_relative 'classes/student_class'
require_relative 'classes/teacher_class'
require_relative 'classes/rental_class'
require_relative 'classes/ui_class'
require_relative 'classes/list_elements_class'
require_relative 'classes/create_elements_class'
require_relative 'classes/data_manager_class'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @list_elements = ListElements.new(@books, @people, @rentals)
    @creale_elements = CreateElements.new(@books, @people, @rentals)
    @data_storage = DataStorage.new
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
    @data_storage.create_data_saver('books.json', @books)
    @data_storage.create_data_saver('people.json', @people)
    @data_storage.create_data_saver('rentals.json', @rentals)
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
