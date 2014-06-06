# Reading data into R

table1 <- read.table(".\\Coursera\\Exploratory Data Analysis\\exdata-data-household_power_consumption\\household_power_consumption.txt",header=T,sep=";")

# Getting the required data of 2 days for plots

table_3 <- table1$Date
table4 <- factor(table_3,levels=c("1/2/2007","2/2/2007"))
table6 <- subset(table1,!is.na(table4))

# Converting data to required formats

table6$Date <- as.Date(table6$Date,"%d/%m/%Y")
table6$Global_active_power <- as.numeric(as.character(table6$Global_active_power))
table6$DayOfWeek <- weekdays(table6$Date)

# Combining Date and Time

a <- as.character(table6$Time)
b <- paste(table6$Date,a,sep=",")
datetime <- strptime(b,"%Y-%m-%d,%H:%M:%S")
table6$Datetime <- datetime
View(table6)

## Plot 3

png(file="plot3.png")
plot(datetime,as.numeric(as.character(table6$Sub_metering_1)),type="l",col="black",xlab="",ylab="Energy sub metering")
lines(datetime,as.numeric(as.character(table6$Sub_metering_2)),type="l",col="red")
lines(datetime,table6$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
