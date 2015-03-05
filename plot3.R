# specify starting and ending rows
rowStart = 66638
rowEnd   = 69518

# open up first row to get names
colNames = read.table("household_power_consumption.txt",nrows = 1, header = T, sep = ';')

# read in relevant data
data = read.table("household_power_consumption.txt",skip = rowStart-2,nrows = rowEnd-rowStart, header = T, sep = ';')

# assign column names
names(data) = names(colNames)

# convert date and time strings
dataDates = as.Date(data$Date, "%d/%m/%Y")
x = paste(dataDates, data$Time)
fulldate = strptime(x, "%Y-%m-%d %H:%M:%S")

# create PNG file
png(file = "plot3.png", width = 480, height = 480)

# make time series plot of energy sub metering, overlay
# numbers 1, 2 and 3
plot(fulldate, data$Sub_metering_1, type = "l", col = 'black', 
     ylab = "Energy sub metering", xlab = "", ylim = c(0,38))
par(new = T)
plot(fulldate, data$Sub_metering_2, type = "l", col = 'red', 
     ylab = "", xlab = "", ylim = c(0,38))
par(new = T)
plot(fulldate, data$Sub_metering_3, type = "l", col = 'blue', 
     ylab = "", xlab = "", ylim = c(0,38))
# add legend
legend(x = "topright", legend = names(data)[7:9], lwd = 1,
       col = c("black","red","blue"))

# close the device
dev.off()
