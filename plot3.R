Data=read.table("household_power_consumption.txt",header=T,sep=";")

Date<-strptime(Data$Date,"%d/%m/%Y")
Date<-as.Date(Date)
Data$Date<-Date
start="2007-02-01"
end="2007-02-02"

DataUse=subset(Data,subset=(Date>=start & Date<=end))

DT<-paste(as.Date(DataUse$Date), DataUse$Time)

DT<-as.POSIXct(DT)


plot(DT,as.numeric(paste(DataUse$Sub_metering_1)),col='black',type='l',ylab = "Energy Sub Metering")
lines(DT,as.numeric(paste(DataUse$Sub_metering_2)),col='red')
lines(DT,as.numeric(paste(DataUse$Sub_metering_3)),col='blue')

legend("topright", col=c("black", "red", "blue"), lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()