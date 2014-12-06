d <- read.table('data/household_power_consumption.txt', sep=";",
                header=TRUE, quote="", na.strings="?", stringsAsFactors=FALSE)

d <- d[d$Date=="1/2/2007"|d$Date=="2/2/2007",]

d$DateTime <- strptime(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(d,
     plot(DateTime,
          Global_active_power,
          type='l',
          xlab='',
          ylab='Global Active Power'
     )
)
with(d,
     plot(DateTime,
          Voltage,
          type='l',
          xlab='datetime',
          ylab='Voltage'
     )
)
with(d,
     plot(DateTime,
          Sub_metering_1,
          type='l',
          col='black',
          xlab='',
          ylab='Energy sub metering'
     )
)
lines(d$DateTime,
      d$Sub_metering_2,
      col="red"
)
lines(d$DateTime,
      d$Sub_metering_3,
      col="blue"
)
legend("topright",
       bty = "n",
       lwd=1,
       cex = 0.75,
       col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
with(d,
     plot(DateTime,
          Global_reactive_power,
          type='l',
          xlab=''
     )
)
dev.off()