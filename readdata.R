readdata <- function(){
        library(dplyr)
        data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
        
        data$Date<-as.Date(data$Date, "%Y-%m-%d")
        data<-mutate(data, DateTime = paste(data$Date, data$Time, sep=" "))
        data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
        
        filtereddata<-subset(data, data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"))
        filtereddata[,3:9] <- as.numeric(as.character(filtereddata[,3:9]))
        
        write.table(filtereddata, file="filtereddata.txt", row.name=FALSE, sep=";")
        
}