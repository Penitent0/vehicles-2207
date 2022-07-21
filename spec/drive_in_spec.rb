require './lib/passenger'
require './lib/vehicle'
require './lib/drive_in'

RSpec.describe DriveIn do
  let!(:drive_in) { DriveIn.new("Scary Palms Drive-in") }
  let!(:vehicle1) { Vehicle.new("2001", "Honda", "Civic") }
  let!(:vehicle2) { Vehicle.new("1998", "Toyota", "Corolla") }

  context 'Drive-in' do
    it 'exists' do
      expect(drive_in).to be_a(DriveIn)
    end  
  end 

  context 'vehicles' do
    it 'can add vehicles' do
      drive_in.add_vehicle(vehicle1)
      expect(drive_in.vehicles).to eq([vehicle1])
    end
  end

  context 'vehicles and passengers' do
    let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }
    let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
    let(:bill) { Passenger.new({"name" => "Bill", "age" => 21}) }

    it 'can list vehicles that have multiple passengers' do
      vehicle1.add_passenger(taylor)
      vehicle2.add_passenger(charlie)
      vehicle2.add_passenger(bill)
      drive_in.add_vehicle(vehicle1)
      drive_in.add_vehicle(vehicle2)
      expect(drive_in.vehicles_with_multiple_passengers).to eq([vehicle2])
    end

    it 'lists passengers under 19' do
      vehicle1.add_passenger(taylor)
      vehicle2.add_passenger(charlie)
      vehicle2.add_passenger(bill)
      drive_in.add_vehicle(vehicle1)
      drive_in.add_vehicle(vehicle2)
      expect(drive_in.passengers_under_age).to eq([taylor])
    end
  end
end