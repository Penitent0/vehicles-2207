class Vehicle
  attr_reader :year,
              :make,
              :model,
              :passengers
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @passengers = []
    @too_fast = false
  end

  def speeding?
    @too_fast
  end

  def speed
    @too_fast = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.select { |passenger| passenger.adult? == true }.count
  end
end