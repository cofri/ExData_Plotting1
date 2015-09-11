# Read data file
EPC <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  na.strings = "?")

# Keep only two days records
EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
EPC2 <- subset(EPC, Date >= as.Date("2007-02-01"))
EPC2 <- subset(EPC2, Date <= as.Date("2007-02-02"))

# Plot histogram
hist(EPC2$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save the histogram to a PNG file (default size is 480 by 480 pixels)
dev.copy(png, file = "plot1.png")
dev.off()
