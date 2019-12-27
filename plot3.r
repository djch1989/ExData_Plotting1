household_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
household_data <- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(household_data$Date), household_data$Time)
household_data$Datetime <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)

with(household_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()