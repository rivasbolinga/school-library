require 'rspec'
require_relative '../decorators/trimmer_decorator'
require_relative '../decorators/capitalize_decorator'
require_relative '../classes/person_class'

describe TrimmerDecorator do
  before(:each) do
    @person = Person.new(333, 'Maximiliusness', 28)
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer = TrimmerDecorator.new(@capitalize)
  end

  describe 'It trims the name of the person' do
    it 'Trims the given name to 10 character' do
      expect(@trimmer.correct_name).to eq('Maximilius')
    end
  end
end
