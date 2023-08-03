require 'rspec'
require_relative '../decorators/capitalize_decorator'
require_relative '../classes/person_class'

describe CapitalizeDecorator do
  before(:each) do
    @person = Person.new(333, 'andrea', 28)
    @capitalize = CapitalizeDecorator.new(@person)
  end

  describe 'It Capitalizes the name of the person' do
    it 'Capitalize first letter of given name' do
      expect(@capitalize.correct_name).to eq('Andrea')
    end
  end
end
