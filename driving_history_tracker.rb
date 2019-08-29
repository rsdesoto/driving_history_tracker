require 'time'
require_relative 'file_input'
require_relative 'file_output'

class DriverReport
  attr_accessor :infile_path, :outfile_path

  def initialize(in_arg, out_arg = "driver_report.txt")
    @infile_path = in_arg
    @outfile_path = out_arg
  end

  def run
    total_driver_stats = FileInput.update_driver_record(@infile_path)

    FileOutput.output_driver_report(total_driver_stats, @outfile_path)
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.length != 1 && ARGV.length != 2
    STDERR.puts("Please enter the name of the file you would like to read in.")
    exit(false)
  end

  if ARGV.length == 1
    DriverReport.new(ARGV[0]).run
  else
    DriverReport.new(ARGV[0], ARGV[1]).run
  end
end
