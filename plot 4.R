data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";") 
power <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

#plot 4
global_active_power <- as.numeric(power$Global_active_power)
global_reactive_power <- as.numeric(power$Global_reactive_power)
voltage <- as.numeric(power$Voltage)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subM1 <- as.numeric(power$Sub_metering_1)
subM2 <- as.numeric(power$Sub_metering_2)
subM3 <- as.numeric(power$Sub_metering_3)


par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
