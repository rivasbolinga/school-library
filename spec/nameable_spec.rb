require 'rspec'
require_relative '../classes/nameable'

describe Nameable do
  context 'Correct Name' do
    it 'raises NotImplementedError for the abstract method' do
      nameable = Nameable.new

      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
