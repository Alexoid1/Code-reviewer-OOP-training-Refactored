require_relative 'Modules/lists'
require_relative 'Modules/creator'

class App
  include Lists
  include Creator
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
    option = gets.chomp.to_i
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
    'Created sucessfully'
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
end

def main
  app = App.new

  app.input_process
end

main
