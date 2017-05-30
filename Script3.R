projDates <- c ("1/2/2007",  "2/2/2007" )

a <- read.table ( file = "../household_power_consumption.txt", header = TRUE, sep =";", , stringsAsFactors=FALSE )

myDF <- as.data.frame(a)

projData <- myDF[which(myDF$Date %in% projDates),]

projData$Time <- strptime(do.call(paste0,projData[c(1,2)]), "%d/%m/%Y%H:%M:%S")

projData$Date <- as.Date(projData$Date, "%d/%m/%Y")

with (projData, plot(Time, as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab =""), axis(2,at= c(10,20,30,40)))

with (projData, points(Time, as.numeric(Sub_metering_2), type="l", col="red"))

with (projData, points(Time, as.numeric(Sub_metering_3), type="l", col="blue"))

legend("topright", pch = NA, lwd = 3, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png")

dev.off()