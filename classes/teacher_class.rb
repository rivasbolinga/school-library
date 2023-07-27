require_relative 'student_class'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
