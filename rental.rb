class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end
end
