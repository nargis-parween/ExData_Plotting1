data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F,dec=".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower<-as.numeric(subsetData$Global_active_power)
datetime<-strptime(paste(subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480,height = 480)
plot(datetime,globalActivePower,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
