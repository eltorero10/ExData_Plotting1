d <- read.table('data/household_power_consumption.txt', sep=";",
                header=TRUE, quote="", na.strings="?", stringsAsFactors=FALSE)

d <- d[d$Date=="1/2/2007"|d$Date=="2/2/2007",]

d$DateTime <- strptime(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 3
png(file = "plot3.png", width = 480, height = 480)
with(d,
     plot(DateTime,
          Sub_metering_1,
          type='l',
          col='black',
          xlab='DateTime',
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
       lwd=1,
       cex = 0.75,
       col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()