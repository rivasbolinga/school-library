class Person
  # Constructor with instance variables
  def initialize(name = "Unknown", age , parent_permission = true)
    @id = generate_id
    @name = name
    @age = age
  end

  # Getters and setteres

  attr_reader :id

  attr_accessor :name :age

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age?
    if @age >= 18
      return true
    else 
      return false
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.

  def can_use_services?
    if of_age?  || @parent_permission
    return true
  end

  def generate_id
    rand(1_000..9_999)
  end  

end