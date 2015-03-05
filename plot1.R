# specify starting and ending rows
rowStart = 66638
rowEnd   = 69518

# open up first row to get names
colNames = read.table("household_power_consumption.txt",nrows = 1, header = T, sep = ';')

# read in relevant data
data = read.table("household_power_consumption.txt",skip = rowStart-2,nrows = rowEnd-rowStart, header = T, sep = ';')

# assign column names
names(data) = names(colNames)

# create PNG file
png(file = "plot1.png", width = 480, height = 480)

# make histogram of global active power
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close the device
dev.off()
