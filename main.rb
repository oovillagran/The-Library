require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

# Create instances and perform tests for each class

# Person
person = Person.new(22, 'maximilianus')
puts 'Person:'
puts "Name: #{person.correct_name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"
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
puts 'Book:'
puts "Title: #{book.title}"
puts "Author: #{book.author}"
puts

# Student
student = Student.new(16, classroom, 'Kilian')
puts 'Student:'
puts "Name: #{student.correct_name}"
puts "Age: #{student.age}"
puts "Can use services? #{student.can_use_services?}"
puts "Classroom: #{student.classroom.label}"
puts "Play hooky: #{student.play_hooky}"
puts "Student's Classroom: #{student.classroom.label}"
puts 'Students in the Classroom:'
classroom.students.each do |student|
puts "- #{student.name}"
end
puts

# Rental
rental = Rental.new('28-06-2023', book, person)
puts 'Rental:'
puts "Date: #{rental.date}"
puts "Book title: #{rental.book.title}"
puts "Person name: #{rental.person.correct_name}"
puts

# Teacher
teacher = Teacher.new(45, 'Economics', 'Mrs. Grace')
puts 'Teacher:'
puts "Name: #{teacher.correct_name}"
puts "Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services?}"
puts
