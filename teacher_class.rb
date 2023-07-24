require_relative 'student_class'

class Teacher < Person
  attr_reader :specialization

  # Constructor extends parent's constructor by adding @spezialitation and a parameter for it.

  def initialize(name = "Unknown", age = nil, parent_permission = true, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  #Override can_use_services? so it always returns true.
  def can_use_services?
    return true
  end
end
