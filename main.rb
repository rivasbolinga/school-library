require_relative 'nameable'
require_relative 'person_class'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new('maximilianus', 22)
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
