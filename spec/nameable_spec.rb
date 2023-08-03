
require 'rspec'
require_relative '../classes/nameable'

class Andrea < Nameable
  def correct_name
    "Andrea"
  end
end

describe Nameable do
  context 'Correct Name' do
    it 'raises NotImplementedError' do
      nameable = Nameable.new

      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe Andrea do
  context 'Correct Name' do
    it 'returns the correct name' do
      correctName = Andrea.new

      expect(correctName.correct_name).to eq('Andrea')
    end
  end
end
