setwd("c:/Projects/Coursera")

df <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

plot1 <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Histogram Global Active Power
hist(plot1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
