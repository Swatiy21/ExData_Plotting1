data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";") 
power <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

#plot 1
global_active_power <- as.numeric(power$Global_active_power)
hist(global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
