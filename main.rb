require_relative 'app'

def main
  app = App.new()
  app.create_book()
  app.list_all_books()
end

main()