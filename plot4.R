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

##Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data_sub, {
  plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Voltage~Datetime, type = "l", ylab= "Voltage", xlab = "")
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
})

##Save as PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()