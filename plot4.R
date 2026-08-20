## Exploratary Data Analysis Project 1
##By Ana Sousa
##Plot4

##Download data 

    path <- getwd() # Get the current working directory
    
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

##Download data 
    download.file(url, file.path(path, "household_power_consumption.zip"))

# Unzip the file
    unzip(file.path(path, "household_power_consumption.zip"))

##Load data in RStudio
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


##Getting data from necessary dates
    data_subset <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
    data_subset[, 3:9] <- lapply(data_subset[, 3:9], as.numeric)
    data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time),format = "%d/%m/%Y %H:%M:%S")


##Making the plot saved in a png file    
    png("plot4.png", width=480, height=480)
    par(mfrow = c(2, 2))
    
    #Plot 1 (top left)
    plot(data_subset$DateTime, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    #Plot 2 (top right)
    plot(data_subset$DateTime, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    #Plot 3 (bottom left)
    plot(data_subset$DateTime, data_subset$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab="")
    lines(data_subset$DateTime, data_subset$Sub_metering_2,type = "l",col = "red")
    lines(data_subset$DateTime, data_subset$Sub_metering_3,type = "l",col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), bty = 'n', col = c("black", "red", "blue"))
    
    #Plot 4 (bottom right)
    plot(data_subset$DateTime, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lwd = 0.5)
    
    dev.off()