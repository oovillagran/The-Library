require_relative 'person'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def list_of_books

end

def list_of_people

end

def create_person

end

def create_book

end

def create_rental

end

def list_of_rentals(person_id)

end

def display_menu
  puts 'Please choose and option by enterin a number'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  loop do
    display_menu
    option = gets.chomp.to_i

    case option
    when 1 
      list_of_books
    when 2
      list_of_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6 list_of_rentals
      puts 'Enter person ID:'
      person_id = gets.chomp.to_i
      list_of_rentals(person_id)
    when 7
      puts 'Good bye!'
      break
    else
      puts 'Invalid option. Please try again.'
    end
    puts
  end
end

main if __FILE__ == $PROGRAM_NAME