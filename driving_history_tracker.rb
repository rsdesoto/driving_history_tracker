require 'time'
require_relative 'file_input'
require_relative 'file_output'

class DriverReport
  attr_accessor :infile_path, :outfile_path

  def initialize(args)
    @infile_path = args
    @outfile_path = "driver_report.txt"
  end

  def run
    total_driver_stats = FileInput.update_driver_record(@infile_path)

    FileOutput.output_driver_report(total_driver_stats, @outfile_path)
  end
end

if $PROGRAM_NAME == __FILE__
  DriverReport.new(ARGV[0]).run
end




# practical object oriented design in ruby
# class: 100 lines
# method: 5 lines
# method takes 4 or fewer parameters
# controllers can instantiate only one object
# break these rules if you have a good reason