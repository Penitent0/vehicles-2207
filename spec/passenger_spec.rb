require './lib/passenger'

RSpec.describe Passenger do
  context 'passenger' do
    let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
    let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }

    it 'exists' do
      expect(charlie).to be_a(Passenger)
    end

    it 'has details' do
      expect(charlie.name).to eq("Charlie")
      expect(taylor.name).to eq("Taylor")
      expect(charlie.age).to eq(18)
      expect(taylor.age).to eq(12)
    end

    it 'has adult? method' do
      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end

    it 'has driver? and drive methods' do
      expect(charlie.driver?).to eq(false)
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end