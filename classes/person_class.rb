require_relative 'nameable'
require_relative 'rental_class'

class Person < Nameable
  attr_reader :i
  attr_accessor :name, :age, :rentals

  # Constructor with instance variables
  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end

  # Turn person into nameable from class Nameable

  def correct_name
    @name
  end

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age?
    @age && @age >= 18
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.

  def can_use_services?
    of_age? || @parent_permission
  end

  # Method to generate an id randomly

  def generate_id
    rand(1_000..9_999)
  end
end
