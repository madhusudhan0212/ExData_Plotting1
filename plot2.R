setwd("D:/Coursera/Data science Specialization/Exploratory Data Analysis")
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
datasub <- data[data$Date == "1/2/2007" |data$Date == "2/2/2007", ]

Global_active_power <- as.numeric(datasub$Global_active_power)/1000
datecolumn1 <- paste(datasub$Date,datasub$Time)
datecolumn <- strptime(datecolumn1,"%d/%m/%Y %H:%M:%S")
datasub1 <- data.frame(datecolumn,Global_active_power)

png(file="plot2.png")
with(datasub1,plot(datecolumn,Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
