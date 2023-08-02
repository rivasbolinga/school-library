require_relative 'student_class'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(id, age, name)
    @specialization = specialization
  end

  def to_hash
    super.merge(specialization: @specialization)
  end

  def can_use_services?
    true
  end
end
