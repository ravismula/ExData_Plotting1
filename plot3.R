data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors= FALSE)
# Set the names to data
names(data) <- data[1, ]

# Subset data in between the required dates.
data <- subset(data, subset= as.Date(data$Date, "%d/%m/%Y") >= "2007-02-01" & 
                     as.Date(data$Date, "%d/%m/%Y")<= "2007-02-02")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Plot 3:

png("ExData_Plotting1/plot3.png",width = 480, height = 480, units= "px", bg="white")

plot(data$DateTime,data$Sub_metering_1  , type = "l",xlab="",
     ylab="Energy Sub metering")

points(data$DateTime,data$Sub_metering_2  , type = "l",xlab="",
       ylab="Sub metering",col = "red")

points(data$DateTime,data$Sub_metering_3  , type = "l",xlab="",
       ylab="Sub metering",col = "blue")

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 2, col = c("black","red","blue"))

dev.off()