# Set the working directory to your local working directory
setwd("c:/Projects/Coursera")
# Be sure the data set 'household_power_consumption.txt' is in the root of the working directory above
# Read the raw data
rawdf <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, 
                  stringsAsFactors = F, comment.char = "", quote = '\"')
# reformat date column values
rawdf$Date<-as.Date(rawdf$Date, format="%d/%m/%Y")
# capture only the data from 2007-02-01 and 2007-02-02 
subdf <- rawdf[(rawdf$Date=="2007-02-01") | (rawdf$Date=="2007-02-02"),]

# reformat sub metering columns as numeric vectors
subdf$Sub_metering_1 <- as.numeric(as.character(subdf$Sub_metering_1))
subdf$Sub_metering_2 <- as.numeric(as.character(subdf$Sub_metering_2))
subdf$Sub_metering_3 <- as.numeric(as.character(subdf$Sub_metering_3))

# final datetime transform
df<-transform(subdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Create png device
png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")

#plot the data
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

# add submetering lines and legend
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

# close device
dev.off()