plot1 <- function() {

tabfirst <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
tabsecond <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",skip=grep("1/2/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=1440)
columnNames <- read.table("./household_power_consumption.txt",sep=";",nrows=1)

tabAll <- rbind(tabfirst,tabsecond)
colnames(tabAll) <- as.character(unlist(columnNames[1,]))
tabAll$Date <- as.Date(tabAll$Date,"%d/%m/%Y")
print(head(tabAll))


png(filename="plot1.png", width = 480, height = 480)
hist(tabAll$Global_active_power, col="red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()
}
