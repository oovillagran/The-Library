class Person
  attr_reader :id, :name, :age, :parent_permission

  def initialize(name = 'Unknown', age = nil, parent_permission = true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    @id = Random.rand(1..1000)
  end
end

require_relative 'student'
require_relative 'teacher'

student = Student.new("Juan Duvalt", 17, true, "Class 101")
puts student.name
puts student.id
puts student.age
puts student.play_hooky
puts student.can_use_services?

teacher = Teacher.new("Teresa Hold", 40, true, "Science")
puts teacher.name
puts teacher.age
puts teacher.id
puts teacher.can_use_services?