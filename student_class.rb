require_relative 'person_class'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
