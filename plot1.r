household_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
household_data <- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y")
png("plot1.png", width=480, height=480)

hist(household_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()