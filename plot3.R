data = read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data = transform(data, DateTime = paste(Date, Time))
data = transform(data, DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))

Sys.setlocale("LC_TIME", "en_US")
par(mfcol=c(1,1))

plot(
  x = data$DateTime,
  y = data$Sub_metering_1,
  main = NA,
  xlab = NA,
  typ = 'l',
  ylab = "Energy sub metering",
  col="black"
)

lines(
  x = data$DateTime,
  y = data$Sub_metering_2,
  col = "red"
)

lines(
  x = data$DateTime,
  y = data$Sub_metering_3,
  col = "blue"
)

legend(
  "topright", 
  merge=TRUE, 
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=c(1,1,1),
  lwd=c(2.5,2.5)
)

dev.copy(png, "plot3.png")
dev.off()

