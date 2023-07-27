require_relative 'app'

def main
  app = App.new()
  app.create_a_person()
end

main()