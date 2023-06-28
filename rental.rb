class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person  = person
    book.rentals << self
    person.rentals << self
  end
end

rental = Rental.new('28-06-2023', 'The Great Gatsby', 'Jane')
puts rental.date # Output: Current date
puts rental.book.title # Output: To Kill a Mockingbird
puts rental.person.name