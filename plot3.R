plot3 <- function(){
        
        
        library(dplyr)
        filtereddata<-read.table("filtereddata.txt", sep=";",row.names=NULL,header=TRUE) 
        
        filtereddata$Date<-as.Date(filtereddata$Date, "%Y-%m-%d")
        filtereddata$DateTime<-strptime(paste(filtereddata$Date, filtereddata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
        filtereddata$Time<-strptime(filtereddata$Time,"%H:%M:%S")
        
        png(filename="plot3.png",width = 480, height = 480)
        plot(filtereddata$DateTime, filtereddata$Sub_metering_1,  type="l", ylab= "Energy Sub Metering",xlab="",ylim=c(0,40))
        par(new=TRUE)
        plot(filtereddata$DateTime, filtereddata$Sub_metering_2, col="red", type="l", ylab= "",xlab="",ylim=c(0,40))
        par(new=TRUE)
        plot(filtereddata$DateTime, filtereddata$Sub_metering_3,  col="blue", type="l", ylab= "",xlab="",ylim=c(0,40))
        par(new=TRUE)
        legend("topright", col=c("black","red","blue"),lty=c(1,1,1), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        par(new=FALSE)
        
        dev.off()
}