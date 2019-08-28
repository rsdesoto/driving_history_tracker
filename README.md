The game plan:

1. figure out how to read in files
2. for each trip - add an extra column with the average speed (as a float)
3. discard anything above 100 mph (up to is fine) and below 5 mph (down to is fine)
4. average those all out
5. sort and output




how i'm thinking about this:

0. read-in -- make sure we can get the file in! the sample input is small enough it can be slurped, but that may not be safe for larger files. read in line by line and do something with each line.
There are some assumptions built into that -- namely, that the data is clean. Every new driver is actually a new driver.
1. assuming the file is good -- each new driver is really a new driver. For each "Driver" line, add the "driver" into a hash as a key.

my initial thought was to capture this as a hash the value will be an array of valid trips. This means that, hypothetically, if you wanted to pull out information about any given trip, you have that information available. Means are inherently reductive; this gives a little more context to any mean for someone interested in getting a closer look at the data.

However, I ended up going with updating with a total distance and total time -- this way you don't have a loop within a loop, which is a bad thing for performance with big files


Some notes about assumptions:

I am assuming that the file is presented with Drivers at top and Trips at the bottom. Otherwise there would need to be an additional sorting step - since this program reads through line by line, it assumes drivers exist before starting in on trip tracking.

This also assumes all times are legit

The hash:

{
  anna: {
    total distance: 20 mi,
    total time: 3.3 hr
  },
  bethany: {
    total distance: 17 mi,
    total time: 4 hr
  },
  cassandra: {
    total distance: 0,
    total time: 0
  }
}