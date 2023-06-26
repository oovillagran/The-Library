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

student = Student.new("John Doe", 16, true, "Class A")
puts student.name # Output: John Doe
puts student.id
puts student.age # Output: 16
puts student.play_hooky # Output: ¯\(ツ)/¯
puts student.can_use_services? # Output: true

teacher = Teacher.new("Jane Smith", 35, true, "Mathematics")
puts teacher.name # Output: Jane Smith
puts teacher.age # Output: 35
puts teacher.can_use_services? # Output: true