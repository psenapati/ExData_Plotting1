setwd("C:/Pradeep Senapati/R Programming")
## Download "household_power_consumption.txt" to the above directory
## Read the file
hpc_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Format date to Type Date
hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
hpc_data <- subset(hpc_data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
## Remove incomplete observation
hpc_data <- hpc_data[complete.cases(hpc_data),]
## Combine Date and Time column
dateTime <- paste(hpc_data$Date, hpc_data$Time)
## Name the vector
dateTime <- setNames(dateTime, "DateTime")
## Remove Date and Time column
hpc_data <- hpc_data[ ,!(names(t) %in% c("Date","Time"))]
## Add DateTime column
hpc_data <- cbind(dateTime, hpc_data)
## Format dateTime Column
hpc_data$dateTime <- as.POSIXct(dateTime)
## Create Plot 2
plot(hpc_data$Global_active_power~hpc_data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
