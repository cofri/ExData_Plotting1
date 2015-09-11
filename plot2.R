# Read data file
EPC <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  na.strings = "?")

# Keep only two days records
EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
EPC2 <- subset(EPC, Date >= as.Date("2007-02-01"))
EPC2 <- subset(EPC2, Date <= as.Date("2007-02-02"))

# Concatenate date and time
date_and_time <- paste(EPC2$Date,EPC2$Time)
EPC2$Date <- strptime(date_and_time,"%Y-%m-%d %H:%M:%S")

# Plot (xticks are in french instead of english (e.g. jeu. is Thu.))
plot(EPC2$Date, EPC2$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Save the histogram to a PNG file (default size is 480 by 480 pixels)
dev.copy(png, file = "plot2.png")
dev.off()
