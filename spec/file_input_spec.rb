require '../file_input.rb'
require 'time'


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
  
end




