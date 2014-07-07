#load data
data <- read.csv("c:\\household_power_consumption.txt",sep=";",header=T,na.strings="?")
#transform date and time into understandable by R timeseries column
data$datetime <- as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
#subset data - fetch only data between 2007-02-01 and 2007-02-02
specific_data <- data[data$datetime >= as.POSIXct("2007-02-01 00:00:00") & data$datetime <= as.POSIXct("2007-02-02 23:59:59"),]
#plot data and save it as .png
png(file="plot4.png")
par(mfrow=c(2,2))
#plot 1,1
with(specific_data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#plot 1,2
with(specific_data,plot(datetime,Voltage,main="",type="l"))
#plot 2,1
with(specific_data,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(specific_data,lines(datetime,Sub_metering_2,col="red"))
with(specific_data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot 2,2
with(specific_data,plot(datetime,Global_reactive_power,type="l",main=""))
dev.off()