##Download and unzip data
setwd("G:/RespaldoEdgar/SDSH/2016 DPB/Solicitudes/R PRUEBA/Coursera/Exploratory Data Analysis")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./household_power_consumption.zip")
unzip('./household_power_consumption.zip', exdir = './Exploratory Data Analysis')

##Read Data
files <- file('./Exploratory Data Analysis/household_power_consumption.txt') 
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


## Graphs 
if(!file.exists('graphs')) dir.create('graphs')

##Open device
png(filename = './graphs/plot3.png', width = 480, height = 480, units='px')

# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
##close device
dev.off()
