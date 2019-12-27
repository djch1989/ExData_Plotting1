household_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
household_data <- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(household_data$Date), household_data$Time)
household_data$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(household_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")})

with(household_data,{
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})
  
with(household_data, plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime"))

dev.off()
