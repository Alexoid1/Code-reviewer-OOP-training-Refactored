require_relative 'Classes/book'
require_relative 'Classes/student'
require_relative 'Classes/teacher'
require_relative 'Classes/rental'

class App
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
  end

  def input_process(input, book_list, people_list, rentals_list)
    case input.to_i
    when 1
      show_books(book_list)
    when 2
      show_people(people_list)
    when 3
      create_person(people_list)
    when 4
      create_book(book_list)
    when 5
      create_rental(rentals_list, book_list, people_list)
    when 6
      show_rentals(rentals_list)
    when 7
      return
    end
    main(book_list, people_list, rentals_list)
  end

  private

  def add_to_list(list, item)
    list << item
    'Created sucessfully'
  end

  def create_book(list)
    puts "\nEnter a book title"
    title = gets.chomp
    puts "\nEnter the author of the book"
    author = gets.chomp
    book = Book.new(title, author)
    add_to_list(list, book)
  end

  def create_person(list)
    puts "\n Do you want to create a (0) Student or a (1) Teacher?"
    input = gets.chomp
    create_student(list) if input == '0'
    create_teacher(list) if input == '1'
  end

  def create_student(list)
    puts "\nEnter the age of the student"
    age = gets.chomp
    puts "\nEnter the name of the student"
    name = gets.chomp
    name == '' ? false : name
    puts 'The person has parent_permission?'
    puts '(0) No permission'
    puts '(1) Permission'
    permission = gets.chomp
    student = Student.new(age, 'none', name, parent_permission: permission == 1)
    add_to_list(list, student)
  end

  def create_teacher(list)
    puts "\nEnter the age of the teacher"
    age = gets.chomp
    puts "\nEnter the name of the teacher"
    name = gets.chomp
    name == '' ? false : name
    puts "\nEnter the specialization of the teacher"
    spec = gets.chomp
    teacher = Teacher.new(spec, age, name)
    add_to_list(list, teacher)
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

  def create_rental(list, book_list, people_list)
    puts "\nChoose a book from the list"
    book_list.each { |b| puts "(#{book_list.index(b)}) Title: '#{b.title}' Author: '#{b.author}'" }
    book_choice = gets.chomp
    validate_num(book_choice, book_list)
    puts "\nChoose a person"
    people_list.each { |person| puts "(#{people_list.index(person)}) Name: '#{person.name}' ID: '#{person.id}'" }
    person_choice = gets.chomp
    validate_num(person_choice, people_list)
    puts "\nPlease enter a day"
    day = gets.chomp
    puts "\nPlease enter a month"
    month = gets.chomp
    puts "\nPlease enter a year"
    year = gets.chomp
    date = "#{day}/#{month}/#{year}"
    validate_date(date)
    rental = Rental.new(date, people_list[person_choice.to_i], book_list[book_choice.to_i])
    puts 'Created successfully'
    add_to_list(list, rental)
  end

  def show_books(list)
    list.each { |b| puts "\nTitle: '#{b.title}' Author: '#{b.author}'" }
  end

  def show_people(list)
    list.each { |person| puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def show_rentals(list)
    puts "\nPlease enter the id of the person"
    id = gets.chomp

    puts "\nRentals:"
    list.each do |r|
      puts "Date: #{r.date}, Book: '#{r.book.title}', Author: '#{r.book.author}'" if id.to_i == r.person.id
    end
  end
end

def main(book_list_input = [], people_list_input = [], rentals_list_input = [])
  app = App.new
  book_list = book_list_input
  people_list = people_list_input
  rentals_list = rentals_list_input
  app.show_options
  user_input = gets.chomp
  app.input_process(user_input, book_list, people_list, rentals_list)
end

main
