require_relative 'Classes/book'
require_relative 'Classes/student'
require_relative 'Classes/teacher'
require_relative 'Classes/rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def show_options
    puts ' '
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp.to_i
  end

  def input_process
    option = show_options

    case option
    when 1
      show_books
    when 2
      show_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      show_rentals
    when 7
      puts 'Thank you for using this app!'

    end
    puts "\n"
  end

  def add_to_list
    puts 'Created sucessfully'
  end

  def validate_num(input, list)
    return unless input.to_i > (list.length - 1) || input == ''

    puts 'Please enter a valid number'
    input = gets.chomp
    validate_num(input, list)
  end

  def validate_date(input)
    return unless input == ''

    puts 'Please enter a valid number'
    input = gets.chomp
    validate_date(input)
  end

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
    create_rental2(day, person_choice, book_choice)
  end

  def create_rental2(day, person_choice, book_choice)
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

  def show_books
    @books.each { |b| puts "\nTitle: '#{b.title}' Author: '#{b.author}'" }
    input_process
  end

  def show_people
    @people.each { |person| puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    input_process
  end

  def show_rentals
    puts "\nPlease enter the id of the person"
    id = gets.chomp.to_i

    puts "\nRentals:"
    @rentals.each do |r|
      puts "Date: #{r.date}, Book: '#{r.book.title}', Author: '#{r.book.author}'" if id.to_i == r.person.id
    end
    input_process
  end
end

def main
  app = App.new

  app.input_process
end

main
