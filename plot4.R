#Reading Data
hpc <- read.table("../household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";")
data <- hpc %>% filter(Date == '1/2/2007' | Date == '2/2/2007')
rm(hpc)

data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data <- data[,3:10]
data <- data %>% select(DateTime,everything())

#Plot4
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))
#Top left graphic
with(data,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

#Bottom left graphic
with(data,plot(DateTime,Sub_metering_1,type="n",xlab="", ylab="Energy sub metering"))
with(data,points(DateTime,Sub_metering_1,col="black",type="l"))
with(data,points(DateTime,Sub_metering_2,col="red",type="l"))
with(data,points(DateTime,Sub_metering_3,col="blue",type="l"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

#Top right graphic
with(data,plot(DateTime,Voltage,type="l"))

#Bottom right graphic
with(data,plot(DateTime,Global_reactive_power,type="l"))
dev.off()