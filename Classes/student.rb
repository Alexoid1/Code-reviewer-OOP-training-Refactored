require_relative './person'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './book'
require 'date'

class Student < Person
  attr_accessor :classroom
  def initialize(age, classroom = 'none', name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def insert_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
