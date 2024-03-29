module FileOutput
  extend self

  def output_driver_report(driver_record_total, outfile_name)
    driver_record_sorted = driver_record_total.sort_by {|driver, info| -info[:distance]}

    driver_report = File.new(outfile_name, 'w')

    driver_record_sorted.each do |driver|
      mph_str = mph_string_generation(driver)

      report_record = "#{driver[0]}: #{driver[1][:distance].round} miles" + mph_str + "\n"

      driver_report.write(report_record)
    end
    driver_report.close
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

