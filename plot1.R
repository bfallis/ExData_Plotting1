################################################################################
#
# Coursera Exploratory Data Analysis - Week 1 Assignment
#
# Tasks:
#
# 1. Recreate the first of the 4 plots given in the objective.
# 
# v0.001 - B.Fallis - 2019/06/30 - Script creation
#
################################################################################

# Read in the data.
ds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
        na.strings = "?")

# Convert the Date and Time columns from character to relevant type.
ds$Date <- as.Date(ds$Date, "%d/%m/%Y")
ds$Time <- strptime(paste(ds$Date, ds$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset the data only for the days required.
dsSubset <- ds[(ds$Date >= "2007-02-01" & ds$Date <= "2007-02-02"), ]

# Open graphics device.
png("plot1.png", width=480, height=480)

# Create plot.
hist(dsSubset$Global_active_power, main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close graphics device.
dev.off()