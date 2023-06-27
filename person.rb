class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def generate_id
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end

require_relative 'student'
require_relative 'teacher'

student = Student.new(17, 'Class 101', 'Juan Duvalt', parent_permission: true)
puts student.name
puts student.id
puts student.age
puts student.play_hooky
puts student.can_use_services?

teacher = Teacher.new(40, 'Science', 'Teresa Hold', parent_permission: true)
puts teacher.name
puts teacher.age
puts teacher.id
puts teacher.can_use_services?
