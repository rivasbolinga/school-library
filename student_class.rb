require_relative 'person_class'

class Student < Person

  # Constructor extends parent's constructor by adding @classroom and a parameter for it.

  def initialize(name = "Unknown", age = nil, parent_permission = true, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end
  
end
