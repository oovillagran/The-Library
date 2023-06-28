class Classroom
  attr_accessor :label
  attr_reader :students
  
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students << student
  end
end

classroom = Classroom.new("Class 101")
puts classroom.label

classroom.label = "Class 202"
puts classroom.label 