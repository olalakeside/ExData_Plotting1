setwd("C:/Users/Ola/Desktop/Desktop/New folder/Aduroja/COURSERA/DATA SCIENCE/Exploratory Data/Week 1/ExData_Plotting1")

# Read data into R


completedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Extract the data for the 2 days for the plot from the complete data

data2days <- subset(completedata, Date %in% c("1/2/2007","2/2/2007"))
data2days$Date <- as.Date(data2days$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2days$Date), data2days$Time)
data2days$Datetime <- as.POSIXct(datetime)

# Plot the chart
with(data2days, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Send a copy of plot as a png format to a file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
