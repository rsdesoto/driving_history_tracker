require '../driving_history_tracker.rb'
require 'tempfile'

describe DriverReport do
  subject { described_class.new(arg1, arg2).run }

  let(:arg1) { test_input_file.path }
  let(:arg2) { test_output_file.path }

  let(:test_input_file) do
    Tempfile.new('txt').tap do |f|
      f << "Driver Beth\n"
      f << "Trip Beth 00:00 00:15 12.2\n"
      f << "Trip Beth 01:00 02:15 42.2\n"
      f << "Driver Angela\n"

      f.close
    end
  end

  let(:test_output_file) { Tempfile.new('txt') }

  after do
    test_output_file.unlink
    test_input_file.unlink
  end

  it 'creates a log of total driver distance and time' do
    subject
    expect(File.open(test_output_file.path).readlines).to eq( ["Beth: 54 miles @ 36 mph\n", "Angela: 0 miles\n"] )
  end
end