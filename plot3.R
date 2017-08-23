library(data.table)
#reading
housenergy <- fread("household_power_consumption.txt", na.strings = "?")
#creating dates (datetime is needed due to show the 3 days of the week)
housenergy$DateTime <- as.POSIXct(paste(housenergy$Date, housenergy$Time), format = "%d/%m/%Y %H:%M:%S")
housenergy$Date <- as.Date(housenergy$Date, format = "%d/%m/%Y")
#selecting between 2007-02-01 and 2007-02-02
housenergy_200702 <- housenergy[ Date >= '2007-02-01' & Date <= '2007-02-02' ]

#script 3
#saving png
png("plot3.png", width=480, height=480)
#line graphs
with(housenergy_200702, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(housenergy_200702, lines(DateTime, Sub_metering_2, col = "red"))
with(housenergy_200702, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1), lty = c(1,1,1))
#closing device to save
dev.off()
