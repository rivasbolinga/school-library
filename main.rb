require_relative 'app'

def main
  app = App.new()
  app.list_all_people()
end

main()