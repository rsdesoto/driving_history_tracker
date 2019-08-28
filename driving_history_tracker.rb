
require 'time'
require_relative 'driver_calculations'

# helper functions ##########################################

def get_file_name
  if ARGV.length != 1
    STDERR.puts("Please enter the name of the file you would like to read in.")
    exit(false)
  else
    filename = ARGV[0]
  end
end

def update_driver_record(filename)
  driver_record_total = {}

  File.foreach(filename) do |line|
    driver_record = line.split(" ")

    data_type = driver_record[0]
    driver_name = driver_record[1]

    if data_type.downcase == "driver"
      driver_record_total[driver_name] = {distance: 0, hrs: 0}
    elsif data_type.downcase == "trip"
      trip_distance_and_time = DriverCalculations.trip_calculation(driver_record[2], driver_record[3], driver_record[4].to_f)

      driver_record_total[driver_name][:distance] += trip_distance_and_time[:distance]
      driver_record_total[driver_name][:hrs] += trip_distance_and_time[:hrs]
    end
  end

  driver_record_total
end

def output_driver_report(driver_record_total)
  driver_record_sorted = driver_record_total.sort_by {|driver, info| -info[:distance]}

  driver_report = File.new('driver_report.txt', 'w')

  driver_record_sorted.each do |driver|
    mph_str = DriverCalculations.mph_string_generation(driver)

    report_record = "#{driver[0]}: #{driver[1][:distance].round} miles" + mph_str + "\n"

    print report_record
    driver_report.write(report_record)
  end
  driver_report.close
end

# program control ##########################################

def create_report
  filename = get_file_name

  total_driver_stats = update_driver_record(filename)

  output_driver_report(total_driver_stats)
end

create_report




# practical object oriented design in ruby
# class: 100 lines
# method: 5 lines
# method takes 4 or fewer parameters
# controllers can instantiate only one object
# break these rules if you have a good reason