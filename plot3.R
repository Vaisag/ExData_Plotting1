plot3 <- function() {
  tabfirst <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
  tabsecond <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("1/2/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
  columnNames <- read.table("./household_power_consumption.txt",sep=";",nrows=1)
  
  tabAll <- rbind(tabfirst,tabsecond)
  
  colnames(tabAll) <- as.character(unlist(columnNames[1,]))
  tabAll$DateTime <-paste(tabAll$Date,tabAll$Time)
  DateTimeNow <- as.POSIXct(tabAll$DateTime,format="%d/%m/%Y %H:%M:%S",tz="")
  print(DateTimeNow)
  png(filename="plot3.png", width = 480, height = 480)
  plot(DateTimeNow,tabAll$Sub_metering_1,ylab = "Energy sub metering",xlab = "Date and Time",type="n")
  lines(DateTimeNow, tabAll$Sub_metering_1, type="l")
  lines(DateTimeNow, tabAll$Sub_metering_2, type="l",col="red")
  lines(DateTimeNow, tabAll$Sub_metering_3, type="l",col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd =c(1,1,1),pch=c(NA,NA,NA),col=c("black","red","blue"))
  dev.off()
}
