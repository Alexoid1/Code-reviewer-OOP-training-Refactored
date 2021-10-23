require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './book'
require 'date'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end
end
