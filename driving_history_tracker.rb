require 'time'
require_relative 'file_input'
require_relative 'file_output'

# helper functions ##########################################

def get_file_name
  if ARGV.length != 1
    STDERR.puts("Please enter the name of the file you would like to read in.")
    exit(false)
  else
    filename = ARGV[0]
  end
end

# program control ##########################################

def create_report
  filename = get_file_name

  total_driver_stats = FileInput.update_driver_record(filename)

  FileOutput.output_driver_report(total_driver_stats)
end

create_report




# practical object oriented design in ruby
# class: 100 lines
# method: 5 lines
# method takes 4 or fewer parameters
# controllers can instantiate only one object
# break these rules if you have a good reason