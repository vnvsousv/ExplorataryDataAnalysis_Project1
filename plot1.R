## ExplorataryDataAnalysis Project 1
##By Ana Sousa
##Plot1

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
    png("plot1.png", width=480, height=480)
    hist(data_subset$Global_active_power, xlab= "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
    dev.off()
    
    