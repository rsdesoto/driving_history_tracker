require 'time'

# data_line = "Trip Dan 07:15 07:45 17.3"
# data_line = "Trip Dan 06:12 06:32 21.8"
data_line = "Trip Alex 12:01 13:16 42.0"
# data_line = "Trip Alex 03:01 14:46 42.0"

data_arr = data_line.split(" ")

starttime = Time.parse(data_arr[2])
endtime = Time.parse(data_arr[3])
miles = data_arr[4]

hrs = (endtime - starttime)/60/60
# this gives the number of hours
puts hrs

puts (miles.to_f / hrs)

