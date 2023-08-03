require_relative 'person_class'
require_relative 'classroom_class'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission, classroom)
    super(id, name, age,  parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_hash
    super.merge(classroom: @classroom)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
