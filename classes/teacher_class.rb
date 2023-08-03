require_relative 'student_class'

class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  def to_hash
    super.merge(specialization: @specialization)
  end

  def can_use_services?
    true
  end
end
