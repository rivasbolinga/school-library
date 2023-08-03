require 'rspec'
require_relative '../classes/student_class'
require_relative '../classes/person_class'
require_relative '../classes/classroom_class'

describe Student do
  before(:each) do
    @student = Student.new('Lionel', 18, true, 'Math')
  end

  context 'Create a new student' do
    it 'add age, name, permission, classroom' do
      expect(@student.age).to eq(18)
      expect(@student.name).to eq('Lionel')
      expect(@student.classroom).to eq('Math')
    end
  end

  context 'Convert to a hash' do
    it 'converts to a hash' do
      expected_hash = {
        name: 'Lionel',
        age: 18,
        type: 'Student',
        parent_permission: true,
        classroom: 'Math'
      }

      result_hash = @student.to_hash

      expect(@student.to_hash).to be_a(Hash)
      expect(result_hash[:name]).to eq(expected_hash[:name])
      expect(result_hash[:age]).to eq(expected_hash[:age])
      expect(result_hash[:type]).to eq(expected_hash[:type])
      expect(result_hash[:parent_permission]).to eq(expected_hash[:parent_permission])
      expect(result_hash[:classroom]).to eq(expected_hash[:classroom])
    end
  end

  context 'Play hooky' do
    it 'returns ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
