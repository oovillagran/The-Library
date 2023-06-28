class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @parent_permission = parent_permission
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student1 = Student.new(17, classroom, "John")
student2 = Student.new(16, classroom, "Jane")
puts student1.classroom.label
puts student2.classroom.label
