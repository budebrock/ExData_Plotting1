projDates <- c ("1/2/2007",  "2/2/2007" )

a <- read.table ( file = "../household_power_consumption.txt", header = TRUE, sep =";", , stringsAsFactors=FALSE )

myDF <- as.data.frame(a)

projData <- myDF[which(myDF$Date %in% projDates),]

projData$Time <- strptime(do.call(paste0,projData[c(1,2)]), "%d/%m/%Y%H:%M:%S")

projData$Date <- as.Date(projData$Date, "%d/%m/%Y")

plot (x=projData$Time, y=as.numeric(projData$Global_active_power), type = "l" ,ylab = "Global Active Power (kilowatts)" , xlab ="")

dev.copy(png,"plot2.png")

dev.off()