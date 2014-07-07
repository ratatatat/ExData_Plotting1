#load data
data <- read.csv("c:\\household_power_consumption.txt",sep=";",header=T,na.strings="?")
#transform date and time into understandable by R timeseries column
data$datetime <- as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
#subset data - fetch only data between 2007-02-01 and 2007-02-02
specific_data <- data[data$datetime >= as.POSIXct("2007-02-01 00:00:00") & data$datetime <= as.POSIXct("2007-02-02 23:59:59"),]
#plot data and save it as .png
png(file="plot1.png")
with(specific_data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()