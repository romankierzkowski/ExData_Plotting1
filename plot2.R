data = read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data = transform(data, DateTime = paste(Date, Time))
data = transform(data, DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))

Sys.setlocale("LC_TIME", "en_US")
par(mfcol=c(1,1))

plot(
  x = data$DateTime,
  y = data$Global_active_power,
  main = NA,
  xlab = NA,
  typ = 'l',
  ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()

