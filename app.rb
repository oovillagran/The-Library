require 'date'
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
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    puts
  end
  
  def list_of_people
    @people.each do |person|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      print "[#{person_type}] "
      print "Name: #{person.name} "
      print "ID: #{person.id} "
      print "Age: #{person.age}"
      puts
    end
  end
  
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
    name = gets.chomp
    print 'Parent Permission (Y/N): '
    parent_permission_input = gets.chomp.upcase

    parent_permission = parent_permission_input == 'y' ? true : false

    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student

    puts 'Student created sucesfully'
    puts
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts 'Teacher created sucesfully'
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
  
  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i

    unless book_index.between?(0, @books.length)
      puts 'Invalid book selection. Please try again.'
      return
    end

    puts 'Select a person from the following list by number(not id):'
    @people.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index}) [#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    unless person_index.between?(0, @people.length)
      puts 'Invalid person selection. Please try again.'
      return
    end

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << rental

    puts 'Rental created successfully'
    puts
  end
  
  def list_of_rentals(person_id)
    person = @people.find { |p| p.id === person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rentals = @rentals.select { |rental| rental.person === person }

    if rentals.empty?
      puts "Rentals:"
      puts "No rentals found for person with ID #{person_id}."
      puts
      return
    end

    puts "Rentals:"

    rentals.each do |rental|
      book = rental.book
      puts "Date: #{rental.date}, Book \"#{book.title}\" by #{book.author}"
    end

    puts
  end
  
  def handle_menu(option)
    options = {
      '1' => method(:list_of_books),
      '2' => method(:list_of_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => proc {
              print 'Enter the person ID: '
              person_id = gets.chomp.to_i
              list_of_rentals(person_id)
            },
      '7' => proc {
              puts 'Thank you for using this app. Good Bye!'
              puts
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
