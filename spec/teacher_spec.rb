require 'rspec'
require_relative '../classes/teacher_class'
require_relative '../classes/person_class'
require_relative '../classes/classroom_class'

describe Student do
  before(:each) do
    @teacher = Teacher.new('Lionel',18, true, 'Math')
    puts "age: #{@student.age} name: #{@student.name} classroom: #{@student.classroom}"
  end

  

end



     
