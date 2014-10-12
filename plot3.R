setwd("D:/Coursera/Data science Specialization/Exploratory Data Analysis")
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
datasub <- data[data$Date == "1/2/2007" |data$Date == "2/2/2007", ]

id1 <- rep("sm1",times=nrow(datasub))
id2 <- rep("sm2",times=nrow(datasub))
id3 <- rep("sm3",times=nrow(datasub))
subdata1 <- data.frame(datasub$Date,datasub$Time,datasub$Sub_metering_1,id1)
names(subdata1) <- c("Date","Time","Submeter_Reading","Sub_id")
subdata2 <- data.frame(datasub$Date,datasub$Time,datasub$Sub_metering_2,id2)
names(subdata2) <- c("Date","Time","Submeter_Reading","Sub_id")
subdata3 <- data.frame(datasub$Date,datasub$Time,datasub$Sub_metering_3,id3)
names(subdata3) <- c("Date","Time","Submeter_Reading","Sub_id")

subfinal <- rbind(subdata1,subdata2,subdata3)
identifier <- subfinal$Sub_id
submetering <- as.numeric(subfinal$Submeter_Reading)
datecolumn13 <- paste(subfinal$Date,subfinal$Time)
datecolumn3 <- strptime(datecolumn13,"%d/%m/%Y %H:%M:%S")
datasub13 <- data.frame(datecolumn3,submetering,identifier)


png(file="plot3.png")
with(datasub13, plot(datecolumn3, submetering, type = "n",ylab="Energy Sub Metering"))
with(subset(datasub13, identifier == "sm1"), points(datecolumn, submetering, col = "black",type="l"))
with(subset(datasub13, identifier == "sm2"), points(datecolumn, submetering, col = "red",type="l"))
with(subset(datasub13, identifier == "sm3"), points(datecolumn, submetering, col = "blue",type="l"))
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
