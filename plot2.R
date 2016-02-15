data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                    na.strings = "?", nrows = 2075259, check.names = F, 
                    stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

date_times <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(date_times)

chart <- plot(sub_data$Global_active_power ~ sub_data$Datetime, type = "l",
              ylab = "Global Active Power (kilowatts)", xlab = "")