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

##Plot 2
plot(data_sub$Global_active_power~data_sub$Datetime, type = "l", ylab = "Global Active Power (kilowatts)",
    xlab = "")

##Save as PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()