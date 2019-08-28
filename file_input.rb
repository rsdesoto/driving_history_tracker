module FileInput
  extend self

  def update_driver_record(filename)
    driver_record_total = {}

    File.foreach(filename) do |line|
      driver_record = line.split(" ")

      data_type = driver_record[0]
      driver_name = driver_record[1]

      if data_type.downcase == "driver"
        driver_record_total[driver_name] = {distance: 0, hrs: 0}
      elsif data_type.downcase == "trip"
        trip_distance_and_time = trip_calculation(driver_record[2], driver_record[3], driver_record[4].to_f)

        driver_record_total[driver_name][:distance] += trip_distance_and_time[:distance]
        driver_record_total[driver_name][:hrs] += trip_distance_and_time[:hrs]
      end
    end

    driver_record_total
  end

  private

  def trip_calculation(start_time, end_time, distance)
    hrs = (Time.parse(end_time) - Time.parse(start_time))/3600
    mph = distance / hrs

    if mph >= 5.0 && mph <= 100.0
      {distance: distance, hrs: hrs}
    else
      {distance: 0, hrs: 0}
    end
  end
end

