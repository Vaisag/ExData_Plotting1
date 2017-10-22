plot2 <- function() {
  tabfirst <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
  tabsecond <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("1/2/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
  columnNames <- read.table("./household_power_consumption.txt",sep=";",nrows=1)
  
  tabAll <- rbind(tabfirst,tabsecond)

  
  
  colnames(tabAll) <- as.character(unlist(columnNames[1,]))
  tabAll$DateTime <-paste(tabAll$Date,tabAll$Time)
  tabAll$Date <- as.Date(tabAll$Date,"%d/%m/%Y")
  DateTimeNow <- as.POSIXct(tabAll$DateTime,format="%d/%m/%Y %H:%M:%S",tz="")
  print(DateTimeNow)
  png(filename="plot2.png", width = 480, height = 480)
  with(tabAll,plot(DateTimeNow, Global_active_power,ylab = "Global Active Power(kilowatts)",xlab = "Date and Time", type="l"))
  dev.off()
}
