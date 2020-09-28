setwd("C:/Users/Ola/Desktop/Desktop/New folder/Aduroja/COURSERA/DATA SCIENCE/Exploratory Data/Week 1/ExData_Plotting1")

# Read data in to R

completedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Extract the data for the 2 days for the plot from the complete data

data2days <- subset(completedata, Date %in% c("1/2/2007","2/2/2007"))
data2days$Date <- as.Date(data2days$Date, format="%d/%m/%Y")

# Plot the Histogram
hist(data2days$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Blue")

# send a copy as a png format to a file
png("plot1.png", width=480, height=480)
dev.off()