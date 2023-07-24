class Person
  # Constructor
  def initialize(name = "Unknown", age , parent_permission = true)
    @id = id
    @name = name
    @age = age
  end

  # Getter

  attr_reader :id

  attr_accessor :name :age
  
  private

  def of_age?
    if @age >= 18
      return true
    else 
      return false
  end

end