library(data.table)
#reading
housenergy <- fread("household_power_consumption.txt", na.strings = "?")
#creating dates (datetime is needed due to show the 3 days of the week)
housenergy$DateTime <- as.POSIXct(paste(housenergy$Date, housenergy$Time), format = "%d/%m/%Y %H:%M:%S")
housenergy$Date <- as.Date(housenergy$Date, format = "%d/%m/%Y")
#selecting between 2007-02-01 and 2007-02-02
housenergy_200702 <- housenergy[ Date >= '2007-02-01' & Date <= '2007-02-02' ]

#script 2
#saving png
png("plot2.png", width=480, height=480)
#line graph
plot(x = housenergy_200702$DateTime, y = housenergy_200702$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#closing device to save
dev.off()
