household_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
household_data <- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(household_data$Date), household_data$Time)
household_data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)

with(household_data, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()
