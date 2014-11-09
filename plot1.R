Data=read.table("household_power_consumption.txt",header=T,sep=";")

Date<-strptime(Data$Date,"%d/%m/%Y")
Date<-as.Date(Date)
Data$Date<-Date
start="2007-02-01"
end="2007-02-02"

DataUse=subset(Data,subset=(Date>=start & Date<=end))

DT<-paste(as.Date(DataUse$Date), DataUse$Time)

DT<-as.POSIXct(DT)


DataUse$DT<-as.POSIXct(DT)

hist(as.numeric(paste(DataUse$Global_active_power)),col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",ylim = c(0,1200))

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()