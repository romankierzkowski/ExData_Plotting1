data = read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data = transform(data, DateTime = paste(Date, Time))
data = transform(data, DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))

Sys.setlocale("LC_TIME", "en_US")
par(mfcol=c(1,1))

hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

