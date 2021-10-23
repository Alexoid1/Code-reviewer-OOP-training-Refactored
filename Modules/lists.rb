require_relative '../Classes/book'
require_relative '../Classes/student'
require_relative '../Classes/teacher'
require_relative '../Classes/rental'

module Lists
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
