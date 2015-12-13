data = read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data = transform(data, DateTime = paste(Date, Time))
data = transform(data, DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))

Sys.setlocale("LC_TIME", "en_US") 
par(mfcol=c(2,2), cex.axis = 0.75)

# PLOT 1:
with(data, {
  plot(
    x = DateTime,
    y = Global_active_power,
    main = NA,
    xlab = NA,
    typ = 'l',
    ylab = "Global Active Power (kilowatts)")
  
  # PLOT 2:
  
  plot(
    x = DateTime,
    y = Sub_metering_1,
    main = NA,
    xlab = NA,
    typ = 'l',
    ylab = "Energy sub metering",
    col="black"
  )
  
  lines(
    x = DateTime,
    y = Sub_metering_2,
    col = "red"
  )
  
  lines(
    x = DateTime,
    y = Sub_metering_3,
    col = "blue"
  )
  
  legend(
    "topright", 
    merge=TRUE, 
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty=c(1,1,1),
    bty = 'n',
    cex = 0.7
  )
  
  # PLOT 3:
  plot(
    x = DateTime,
    y = Voltage,
    xlab="datetime",
    typ="l"
  )

  # PLOT 4:
  plot(
    x = DateTime,
    y = Global_reactive_power,
    xlab="datetime",
    typ="l"
  )
  
}) 

dev.copy(png, "plot4.png")
dev.off()

