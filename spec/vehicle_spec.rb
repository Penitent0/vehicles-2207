require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  let!(:vehicle) { Vehicle.new("2001", "Honda", "Civic") }

  context 'vehicle' do
    it 'instantiates' do
      expect(vehicle).to be_a(Vehicle)
    end

    it 'has attributes' do
      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  context 'passengers' do
    let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
    let(:jude) { Passenger.new({"name" => "Jude", "age" => 20}) }
    let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }

    it 'can be added to vehicle' do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end

    it 'that are adults can be returned' do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.num_adults).to eq(2)
    end
  end
end




