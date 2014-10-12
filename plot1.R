setwd("D:/Coursera/Data science Specialization/Exploratory Data Analysis")
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
datasub <- data[data$Date == "1/2/2007" |data$Date == "2/2/2007", ]
png(file="plot1.png")
hist(as.numeric(datasub$Global_active_power)/1000,xlab="Global Active power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red",ylim=range(0,200,400,600,800,1000,1200))
dev.off()
