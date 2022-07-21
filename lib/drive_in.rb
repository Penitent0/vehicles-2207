class DriveIn
  attr_reader :name,
              :vehicles
  def initialize(name)
    @name = name
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def vehicles_with_multiple_passengers
    @vehicles.select { |vehicle| vehicle.passengers.count > 1}
  end

  def passengers_under_age
    array = @vehicles.map { |vehicle| vehicle.passengers }
    array.flatten.select { |passenger| passenger.adult? == false }
  end
end