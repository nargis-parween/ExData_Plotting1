data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F,dec=".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower<-as.numeric(subsetData$Global_active_power)
datetime<-strptime(paste(subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,1))

plot(datetime,as.numeric(subsetData$Global_active_power),xlab="",ylab="Global Active Power",type="l")

plot(datetime,subsetData$Voltage,ylab="Voltage",type="l")

plot(datetime,subsetData$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(datetime,subsetData$Sub_metering_2,type="l",col="red")
lines(datetime,subsetData$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,cex=.75)

plot(datetime,subsetData$Global_reactive_power,ylab="Global_reactive_power",type="l")
dev.off()
