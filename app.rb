require_relative 'person'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to Library App!'
    puts
  end

  def list_of_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  end
  
  # def list_of_people
  
  # end
  
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_i
    print 'Parent Permission (Y/N): '
    parent_permission_input = gets.chomp.upcase

    parent_permission = parent_permission_input == 'y' ? true : false

    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student

    puts 'Student created sucesfully'
    puts
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
    puts
  end
  
  # def create_rental
  
  # end
  
  # def list_of_rentals(person_id)
  
  # end
  
  def handle_menu(option)
    options = {
      '1' => method(:list_of_books),
      # '2' => method(:list_all_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      # '5' => method(:create_rental),
      # '6' => method(:list_of_rentals),
      '7' => proc {
              puts 'Thank you for using this app. Good Bye!'
              exit
            }
    }

    if(options)[option]
      options[option].call
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def main
    puts 'Please choose and option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp

    handle_menu(option)
    main
  end
end
