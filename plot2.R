#Reading Data
hpc <- read.table("../household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";")
data <- hpc %>% filter(Date == '1/2/2007' | Date == '2/2/2007')
rm(hpc)

data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data <- data[,3:10]
data <- data %>% select(DateTime,everything())

#Plot2

png("plot2.png", width = 480, height = 480)
with(data,plot(DateTime,Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()