data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";") 
power <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot 3
subM1 <- as.numeric(power$Sub_metering_1)
subM2 <- as.numeric(power$Sub_metering_2)
subM3 <- as.numeric(power$Sub_metering_3)

plot(datetime, subM1, type="l", ylab="Energy sub metering", xlab = "")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()