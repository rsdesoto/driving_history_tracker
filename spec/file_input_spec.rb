require '../file_input.rb'
require 'time'
require 'tempfile'

describe "trip_calculation" do
  let(:distance1) { 100 }
  let(:distance2) { 325.3 }
  let(:distance3) { 16.2 }

  it 'returns a hash with time and distance' do
    expect(FileInput.trip_calculation("00:00", "03:15", distance1)).to eq ({distance: distance1, hrs: 3.25})
  end

  it 'returns 0 distance and 0 time for > 100 mph' do
    expect(FileInput.trip_calculation("00:00", "03:15", distance2)).to eq ({distance: 0, hrs: 0})
  end

  it 'returns 0 distance and 0 time for < 5 mph' do
    expect(FileInput.trip_calculation("00:00", "03:15", distance3)).to eq ({distance: 0, hrs: 0})
  end
end

describe "update_driver_record" do
  let(:test_input_file_driver) do
    Tempfile.new('txt').tap do |f|
      f << "Driver Jane\n"

      f.close
    end
  end

  let(:test_input_file_trip) do
    Tempfile.new('txt').tap do |f|
      f << "Driver Beth\n"
      f << "Trip Beth 00:00 00:15 12.2\n"

      f.close
    end
  end

  after do
    test_input_file_driver.unlink
    test_input_file_trip.unlink
  end

  it 'creates a new driver' do
    expect(FileInput.update_driver_record(test_input_file_driver)).to eq ({"Jane" => {distance: 0, hrs: 0}})
  end

  it 'adds hour and mileage data to an existing driver' do
    expect(FileInput.update_driver_record(test_input_file_trip)).to eq ({"Beth" => {distance: 12.2, hrs: 0.25}})
  end
end




