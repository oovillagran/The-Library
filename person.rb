class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method'
  end
end

class Person < Nameable
  attr_accessor :name, :age, :books
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
    @books = []
  end

  def generate_id
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
