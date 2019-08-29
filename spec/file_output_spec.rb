require '../file_output.rb'
require 'tempfile'

describe "mph_string_generation" do
  let(:driver_record_zero) { ["Name",{distance: 0, hrs: 0}] }
  let(:driver_record_data) { ["Name",{distance: 18.2, hrs: 2.1}] }
  it 'returns a blank string if a driver driven 0 distance' do
    expect(FileOutput.mph_string_generation(driver_record_zero)).to eq("")
  end

  it 'returns a string with mph if a driver has driven' do
    expect(FileOutput.mph_string_generation(driver_record_data)).to eq(" @ 9 mph")
  end
end

describe "output_driver_report" do
  let(:test_out_file) { Tempfile.new('txt') }
  let(:driver_record) { {"Name" => {:distance => 18.2, :hrs => 2.1}} }

  before do
    FileOutput.output_driver_report(driver_record, test_out_file)
  end

  after do
    test_out_file.unlink
  end

  it 'outputs a file with the appropriate driver information' do
    expect(File.open(test_out_file.path).readlines).to eq( ["Name: 18 miles @ 9 mph\n"] )
  end
end

