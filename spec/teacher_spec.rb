require 'rspec'
require_relative '../classes/teacher_class'
require_relative '../classes/person_class'
require_relative '../classes/classroom_class'

describe Student do
  before(:each) do
    @teacher = Teacher.new('Kelvin',40, 'Computer Science')
    puts "name: #{@teacher.name} age: #{@teacher.age} specialization: #{@teacher.specialization}"
  end

  context 'Create a new teacher' do
    it 'add name, age, specialization' do
        
      expect(@teacher.name).to eq('Kelvin')
      expect(@teacher.age).to eq(40)
      expect(@teacher.specialization).to eq('Computer Science')
    end
  end  

end

  



     
