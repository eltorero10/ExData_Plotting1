d <- read.table('data/household_power_consumption.txt', sep=";",
                header=TRUE, quote="", na.strings="?", stringsAsFactors=FALSE)

d <- d[d$Date=="1/2/2007"|d$Date=="2/2/2007",]

d$DateTime <- strptime(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(d$Global_active_power,
     col='red',
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power'
)
dev.off()