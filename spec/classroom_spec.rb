require 'rspec'
require_relative '../classes/book_class'
require_relative '../classes/rental_class'
require_relative '../classes/person_class'
require_relative '../classes/classroom_class'
require_relative '../classes/student_class'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Class A')
  end

  context 'Create a classroom' do
    it 'add the label to the classroom' do
      expect(@classroom.label).to eq('Class A')
    end
  end

  context 'Add students to the classroom' do
    it 'has an empty students array initially' do
      expect(@classroom.students).to be_empty
    end

    it 'can add student to the classroom' do
      new_student = Student.new(12, 'Alice', true, @classroom)
      @classroom.add_student(new_student)

      expect(@classroom.students).to include(new_student)
    end
  end
end
