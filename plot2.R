Data=read.table("household_power_consumption.txt",header=T,sep=";")

Date<-strptime(Data$Date,"%d/%m/%Y")
Date<-as.Date(Date)
Data$Date<-Date
start="2007-02-01"
end="2007-02-02"

DataUse=subset(Data,subset=(Date>=start & Date<=end))

DT<-paste(as.Date(DataUse$Date), DataUse$Time)

DT<-as.POSIXct(DT)


plot(DT,as.numeric(paste(DataUse$Global_active_power)),ylab = "Global Active Power",xlab = "",type='l')


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()