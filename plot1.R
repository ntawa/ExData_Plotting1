plot1 <- function(){
        
        
        library(dplyr)
        filtereddata<-read.table("filtereddata.txt", sep=";",row.names=NULL,header=TRUE) 
        
        filtereddata$Date<-as.Date(filtereddata$Date, "%Y-%m-%d")
        filtereddata$DateTime<-strptime(paste(filtereddata$Date, filtereddata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
        filtereddata$Time<-strptime(filtereddata$Time,"%H:%M:%S")
        
        png(filename="plot1.png",width = 480, height = 480)
        hist(filtereddata$Global_active_power, breaks=13, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
}