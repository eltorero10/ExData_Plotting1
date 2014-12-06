d <- read.table('data/household_power_consumption.txt', sep=";",
                header=TRUE, quote="", na.strings="?", stringsAsFactors=FALSE)

d <- d[d$Date=="1/2/2007"|d$Date=="2/2/2007",]

d$DateTime <- strptime(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 2
png(file = "plot2.png", width = 480, height = 480)
with(d,
     plot(DateTime,
          Global_active_power,
          type='l',
          xlab='',
          ylab='Global Active Power (kilowatts)'
     )
)
dev.off()