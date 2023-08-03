require 'rspec'
require_relative '../classes/teacher_class'
require_relative '../classes/person_class'
require_relative '../classes/classroom_class'

describe Student do
  before(:each) do
    @teacher = Teacher.new('Kelvin', 40, 'Computer Science')
  end

  context 'Create a new teacher' do
    it 'add name, age, specialization' do
      expect(@teacher.name).to eq('Kelvin')
      expect(@teacher.age).to eq(40)
      expect(@teacher.specialization).to eq('Computer Science')
    end
  end

  context 'Convert to a hash' do
    it 'converts to a hash' do
      expected_hash = {
        name: 'Kelvin',
        age: 40,
        type: 'Teacher',
        specialization: 'Computer Science'
      }

      result_hash = @teacher.to_hash

      expect(@teacher.to_hash).to be_a(Hash)
      expect(result_hash[:name]).to eq(expected_hash[:name])
      expect(result_hash[:age]).to eq(expected_hash[:age])
      expect(result_hash[:type]).to eq(expected_hash[:type])
      expect(result_hash[:specialization]).to eq(expected_hash[:specialization])
    end
  end

  context 'Can use services' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end
