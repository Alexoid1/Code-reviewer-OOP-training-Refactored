require_relative '../Classes/book'
require_relative '../Classes/student'
require_relative '../Classes/teacher'
require_relative '../Classes/rental'

module Creator
  def create_book
    puts "\nEnter a book title"
    title = gets.chomp
    puts "\nEnter the author of the book"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    add_to_list
    input_process
  end

  def create_person
    puts "\n Do you want to create a (0) Student or a (1) Teacher?"
    input = gets.chomp
    create_student if input == '0'
    create_teacher if input == '1'
  end

  def create_student
    puts "\nEnter the age of the student"
    age = gets.chomp
    puts "\nEnter the name of the student"
    name = gets.chomp
    name == '' ? false : name
    puts 'The person has parent_permission?'
    puts '(0) No permission'
    puts '(1) Permission'
    permission = gets.chomp
    student = Student.new(age, name, parent_permission: permission == 1)
    @people << student
    add_to_list
    input_process
  end

  def create_teacher
    puts "\nEnter the age of the teacher"
    age = gets.chomp
    puts "\nEnter the name of the teacher"
    name = gets.chomp
    name == '' ? false : name
    puts "\nEnter the specialization of the teacher"
    spec = gets.chomp
    teacher = Teacher.new(age, spec, name)
    @people << teacher
    add_to_list
    input_process
  end

  def create_rental
    puts "\nChoose a book from the list"
    @books.each_with_index { |b, i| puts "(#{i}) Title: '#{b.title}' Author: '#{b.author}'" }
    book_choice = gets.chomp
    validate_num(book_choice, @books)
    puts "\nChoose a person"
    @people.each_with_index { |person, i| puts "(#{i}) Name: '#{person.name}' ID: '#{person.id}'" }
    person_choice = gets.chomp
    validate_num(person_choice, @people)
    puts "\nPlease enter a day"
    day = gets.chomp
    puts "\nPlease enter a month"
    month = gets.chomp
    puts "\nPlease enter a year"
    year = gets.chomp
    date = "#{day}/#{month}/#{year}"
    validate_date(date)
    rental = Rental.new(date, @people[person_choice.to_i], @books[book_choice.to_i])
    puts 'Created successfully'
    @rentals << rental
    add_to_list
    input_process
  end
end
