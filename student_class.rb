require_relative 'person_class'

class Student < Person

  attr_reader :classroom

  # Constructor extends parent's constructor by adding @classroom and a parameter for it.

  def initialize(name = "Unknown", age = nil, parent_permission = true, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

# Method play_hooky that returns "¯\(ツ)/¯".

  def play_hooky
    "¯\\(ツ)/¯"
  end
  
end
