library(data.table)
#reading
housenergy <- fread("household_power_consumption.txt", na.strings = "?")
#creating dates (datetime is needed due to show the 3 days of the week)
housenergy$DateTime <- as.POSIXct(paste(housenergy$Date, housenergy$Time), format = "%d/%m/%Y %H:%M:%S")
housenergy$Date <- as.Date(housenergy$Date, format = "%d/%m/%Y")
#selecting between 2007-02-01 and 2007-02-02
housenergy_200702 <- housenergy[ Date >= '2007-02-01' & Date <= '2007-02-02' ]

#script 4
#saving png
png("plot4.png", width=480, height=480)
#2x2 graphs
par(mfrow = c(2,2), mar = c(5, 4, 2, 1))
#graph 1,1
plot(housenergy_200702$DateTime, housenergy_200702$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#graph 1,2
plot(housenergy_200702$DateTime, housenergy_200702$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#graph 2,1
plot(housenergy_200702$DateTime, housenergy_200702$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(housenergy_200702$DateTime, housenergy_200702$Sub_metering_2, col = "red")
lines(housenergy_200702$DateTime, housenergy_200702$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1), lty = c(1,1,1), bty = "n")
#graph 2,2
plot(housenergy_200702$DateTime, housenergy_200702$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#closing device to save
dev.off()
