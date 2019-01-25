data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F,dec=".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower<-as.numeric(subsetData$Global_active_power)
datetime<-strptime(paste(subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480,height = 480)
plot(datetime,subsetData$Sub_metering_1,type="l",xlab="", ylab="Energy Sub metering")
lines(datetime,subsetData$Sub_metering_2,type="l",col="red")
lines(datetime,subsetData$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd2.5)
dev.off()
