require '../file_output.rb'


describe "mph_string_generation" do
  it 'returns a blank string if a driver driven 0 distance' do
    expect(FileOutput.mph_string_generation(["Name",{distance: 0, hrs: 0}])).to eq("")
  end

  it 'returns a string with mph if a driver has driven' do
    expect(FileOutput.mph_string_generation(["Name",{distance: 18.2, hrs: 2.1}])).to eq(" @ 9 mph")
  end
end




