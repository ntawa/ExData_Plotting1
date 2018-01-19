plot2 <- function(){
        
        
        library(dplyr)
        filtereddata<-read.table("filtereddata.txt", sep=";",row.names=NULL,header=TRUE) 
        
        filtereddata$Date<-as.Date(filtereddata$Date, "%Y-%m-%d")
        filtereddata$DateTime<-strptime(paste(filtereddata$Date, filtereddata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
        filtereddata$Time<-strptime(filtereddata$Time,"%H:%M:%S")
        
        png(filename="plot2.png",width = 480, height = 480)
        plot(filtereddata$DateTime, filtereddata$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)",xlab="")
        dev.off()
}