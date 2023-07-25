require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.lenght > 10 ? @nameable.correct_name.strip! : @nameable.correct_name
  end
end