require 'time'

if ARGV.length != 1
  STDERR.puts("Please enter the name of the file you would like to read in.")
  exit(false)
end

filename = ARGV[0]
driver_record_total = {}

File.foreach(filename) do |line|
  driver_record = line.split(" ")

  if driver_record[0].downcase == "driver"
    driver_record_total[driver_record[1]] = {distance: 0, hrs: 0}
  elsif driver_record[0].downcase == "trip"
    distance = driver_record[4].to_f
    hrs = (Time.parse(driver_record[3]) - Time.parse(driver_record[2]))/3600
    mph = distance / hrs

    if mph >= 5.0 && mph <= 100.0
      driver_record_total[driver_record[1]][:distance] += distance
      driver_record_total[driver_record[1]][:hrs] += hrs
    end
  end
end

driver_record_sorted = driver_record_total.sort_by {|k, v| -v[:distance]}

driver_report = File.new('driver_report.txt', 'w')

driver_record_sorted.each do |driver|
  if driver[1][:distance] > 0
    mph = driver[1][:distance] / driver[1][:hrs]
    mph_str = " @ #{mph.round} mph"
  else
    mph_str = ""
  end

  report_record = "#{driver[0]}: #{driver[1][:distance].round} miles" + mph_str + "\n"

  print report_record
  driver_report.write(report_record)
end

driver_report.close

