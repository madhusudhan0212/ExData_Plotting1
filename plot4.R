setwd("D:/Coursera/Data science Specialization/Exploratory Data Analysis")
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
datasub <- data[data$Date == "1/2/2007" |data$Date == "2/2/2007", ]

Global_active_power <- as.numeric(datasub$Global_active_power)/1000
Voltage <- as.numeric(datasub$Voltage)
Global_reactive_power <- as.numeric(datasub$Global_reactive_power)/1000
datecolumn1 <- paste(datasub$Date,datasub$Time)
datecolumn <- strptime(datecolumn1,"%d/%m/%Y %H:%M:%S")
datasub1 <- data.frame(datecolumn,Global_active_power,Voltage,Global_reactive_power)

png(file="plot4.png")

par(mfrow=c(2,2))
with(datasub1,{
    plot(datecolumn,Global_active_power,type="l",xlab = "", ylab = "Global Active Power")
    plot(datecolumn,Voltage,type="l",xlab = "datetime", ylab = "Voltage")
    plot(datecolumn,Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(datecolumn,Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
