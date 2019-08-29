# Driver Report Generator

This program takes in a text file of drivers and trips to create a report of each driver.

## Assumptions

- The file read in contains Drivers at the top and Trips at the bottom. If this isn't the case, an additional sorting step would be needed for my code to work.
- This program assumes all times and distances are as presented and does not implement data quality checks.

## Approach

I first thought about some potential pitfalls of reading in files. The sample file presented was small enough to be imported in one step without causing any problems, but larger files could present a problem; as a result, I assumed the input file has already been pre-processed to get the data into the right format, then read in the file one line at a time.

I calculated each driver's total driving distance and time as I moved through the document, creating a hash with the driver's name as a key and a hash of total mileage and time driving. Since I decided to approach the data line-by-line, reading in the whole file and then doing calculations on the entire thing would remove any performance advantage. Before adding any increase in time or mileage, I made sure each trip was at least 5 mph and no greater than 100 mph.

Finally, I sorted the hash by total distance traveled, converting it to an array, then iterated through it to generate the final driver report.

## Next steps

The tests I created involve hard-coded values fed into the report generator. With more time I would have changed these to randomized values in order to catch potential pitfalls I didn't think of while writing the initial generator. Additionally, while I assumed all data being fed in would be good, adding some quality control checks or data clean-up would be nice.