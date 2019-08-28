module DriverCalculations
  extend self

  def trip_calculation(start_time, end_time, distance)
    hrs = (Time.parse(end_time) - Time.parse(start_time))/3600
    mph = distance / hrs

    if mph >= 5.0 && mph <= 100.0
      {distance: distance, hrs: hrs}
    else
      {distance: 0, hrs: 0}
    end
  end

  def mph_string_generation(driver)
    if driver[1][:distance] > 0
      mph = driver[1][:distance] / driver[1][:hrs]
      mph_str = " @ #{mph.round} mph"
    else
      mph_str = ""
    end
  end
end