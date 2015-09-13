# Read data from the file and into data.
data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors= FALSE)
#Set the names to data
names(data) <- data[1, ]

# Subset data in between the required dates.
data <- subset(data, subset= as.Date(data$Date, "%d/%m/%Y") >= "2007-02-01" & 
                     as.Date(data$Date, "%d/%m/%Y")<= "2007-02-02")

# Plot 1:

hist(as.numeric(data$Global_active_power), main= "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

png("ExData_Plotting1/plot1.png", width=480, height=480, units= "px", bg="white")

hist(as.numeric(data$Global_active_power), main= "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

dev.off()