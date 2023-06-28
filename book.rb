class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental
    @rentals
  end
end

book = Book.new("The Great Gatsby", "F. Scott Fitzgerald")
puts book.title
puts book.author
book.title = "To Kill a Mockingbird"
book.author = "Harper Lee"
puts book.title
puts book.author
