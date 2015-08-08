# Set the working directory to your local working directory
setwd("c:/Projects/Coursera")
# Be sure the data set is in the root of the working directory above
# Read the raw data
rawdf <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, 
               stringsAsFactors = F, comment.char = "", quote = '\"')
# reformat date column values
rawdf$Date<-as.Date(rawdf$Date, format="%d/%m/%Y")
# capture only the data from 2007-02-01 and 2007-02-02 
subdf <- rawdf[(rawdf$Date=="2007-02-01") | (rawdf$Date=="2007-02-02"),]
# change column
subdf$Global_active_power<-as.numeric(as.character(subdf$Global_active_power))
# final datetime transform
df<-transform(subdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# Create png device
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
# write Histogram Global Active Power to device
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close device
dev.off()