class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @parent_permission = parent_permission
    self.classroom = classroom if classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
