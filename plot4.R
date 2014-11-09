Data=read.table("household_power_consumption.txt",header=T,sep=";")

Date<-strptime(Data$Date,"%d/%m/%Y")
Date<-as.Date(Date)
Data$Date<-Date
start="2007-02-01"
end="2007-02-02"

DataUse=subset(Data,subset=(Date>=start & Date<=end))

DT<-paste(as.Date(DataUse$Date), DataUse$Time)

DT<-as.POSIXct(DT)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Top Left plot  
plot(DT,as.numeric(paste(DataUse$Global_active_power)),ylab = "Global Active Power",xlab = "",type='l')
#Top Right Plot
plot(DT,as.numeric(paste(DataUse$Voltage)),ylab = "Voltage",xlab = "datetime",type='l')
#Bot Left Plot
plot(DT,as.numeric(paste(DataUse$Sub_metering_1)),col='black',type='l',ylab = "Energy Sub Metering")
lines(DT,as.numeric(paste(DataUse$Sub_metering_2)),col='red')
lines(DT,as.numeric(paste(DataUse$Sub_metering_3)),col='blue')

legend("topright", col=c("black", "red", "blue"),bty = 'n', lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
#Bot Right plot
plot(DT,as.numeric(paste(DataUse$Global_reactive_power)),type = 'l',ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
  
