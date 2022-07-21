class Passenger
  attr_reader :name,
              :age
  def initialize(details)
    @name = details["name"]
    @age = details["age"]
    @license = false
  end

  def adult?
    return false if @age < 18
    true
  end

  def driver?
    @license
  end

  def drive
    @license = true
  end
end