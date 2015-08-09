##load complete data
complete_data <- read.csv("./data/household_power_consumption.txt", header = T, sep = ';', na.strings="?", 
                          nrows=2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
complete_data$Date <- as.Date(complete_data$Date, format = "%d/%m/%Y")

## data subset
data_sub <- subset(complete_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(complete_data)

## convert dates
dateTime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(dateTime)

##Plot 3
with(data_sub, {
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save as PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()