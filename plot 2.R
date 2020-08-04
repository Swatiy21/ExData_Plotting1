data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";") 
power <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

# plot 2
global_active_power <- as.numeric(power$Global_active_power)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
