data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors= FALSE)
# Set the names to data
names(data) <- data[1, ]

# Subset data in between the required dates.
data <- subset(data, subset= as.Date(data$Date, "%d/%m/%Y") >= "2007-02-01" & 
                     as.Date(data$Date, "%d/%m/%Y")<= "2007-02-02")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Plot 2:

png("ExData_Plotting1/plot2.png", width=480, height=480, units= "px", bg="white")

plot(data$DateTime, data$Global_active_power, type = "l", xlab="", ylab=
           "Global Active Power (kilowatts)")

dev.off()