require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

# Create instances and perform tests for each class

# Person
person = Person.new(22, 'maximilianus')
# person_1 = Person.new(25, 'John')
# person_2 = Person.new(30, 'Alice')
puts 'Person:'
puts "Name: #{person.correct_name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"
# puts 'Person 1:'
# puts "Name: #{person_1.correct_name}"
# puts "Age: #{person_1.age}"
# puts "Can use services? #{person_1.can_use_services?}"
# puts 'Person 2:'
# puts "Name: #{person_2.correct_name}"
# puts "Age: #{person_2.age}"
# puts "Can use services? #{person_2.can_use_services?}"
puts

# Decorator
capitalized_person = CapitalizeDecorator.new(person)
puts 'Capitalized Person:'
puts "Correct name: #{capitalized_person.correct_name}"
puts

# TrimmerDecorator
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts 'Capitalized and Trimmed Person:'
puts "Correct name: #{capitalized_trimmed_person.correct_name}"
puts

# Classroom
classroom = Classroom.new('Class 101')
puts 'Classroom:'
puts "Label: #{classroom.label}"
puts

# Book
book = Book.new('From Earth to the Moon', 'Julio Verne')
# book_1 = Book.new('Leadership', 'Joyce Meyer')
# book_2 = Book.new('Lion\'s Heart', 'Abel Dwen')
puts 'Book:'
puts "Title: #{book.title}"
puts "Author: #{book.author}"
# puts 'Book 1:'
# puts "Title: #{book_1.title}"
# puts "Author: #{book_1.author}"
# puts 'Book 2:'
# puts "Title: #{book_2.title}"
# puts "Author: #{book_2.author}"
puts

# Student
student = Student.new(16, classroom, 'Kilian')
puts 'Student:'
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Can use services? #{student.can_use_services?}"
puts "Classroom: #{student.classroom.label}"
puts "Play hooky: #{student.play_hooky}"
puts "Student's Classroom: #{student.classroom.label}"
puts 'Students in the Classroom:'
classroom.students.each do |student_each|
  puts "- #{student_each.name}"
end
puts

# Rental
rental = Rental.new('28-06-2023', person, book)
puts 'Rental:'
puts "Date: #{rental.date}"
puts "Book title: #{rental.book.title}"
puts "Person name: #{rental.person.correct_name}"
puts

# Adding rentals for person 1
# person_1.add_rental(book_2, '2023-06-23')
# person_1.add_rental(book_1, '2023-06-24')

# Adding rentals for person2
# person_2.add_rental(book, '2023-06-25')

# Printing the rentals for each person
puts "Rentals for #{person.name}:"
person.rentals.each do |rental_item|
  puts "#{rental_item.book.title} - #{rental_item.date}"
end
puts

# puts "Rentals for #{person_1.name}:"
# person_1.rentals.each do |rental_item|
#   puts "#{rental_item.book.title} - #{rental_item.date}"
# end
# puts

# puts "Rentals for #{person_2.name}:"
# person_2.rentals.each do |rental_item|
#   puts "#{rental_item.book.title} - #{rental_item.date}"
# end
# puts

# Teacher
teacher = Teacher.new(45, 'Economics', 'Mrs. Grace')
puts 'Teacher:'
puts "Name: #{teacher.correct_name}"
puts "Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services?}"
puts
