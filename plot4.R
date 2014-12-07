#EDA Course Assignment 1
#6th December 2014-John Curry
#inputs some open data, does some preprocessing and makes a plot using Base Package
pwr <-read.csv("c:/r/eda/pwr.txt", sep=";", na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
pwr$Date <-as.Date(pwr$Date, "%d/%m/%Y")
pwr$Time<-strptime(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
pwr2<- subset(pwr,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))


#4.Produce Set of 4 Graphs to Same Output
#So set up par for two rows and 2 cols then fill in graphs.
png(file="C:/Users/jcurry/Documents/GitHub/ExData_Plotting1/plot4.png",width=480,height=480)
par(mfrow=c(2,2))

with (pwr2,plot(Time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)"))
with (pwr2, lines(Time, Global_active_power))

with (pwr2,plot(Time, Voltage, type="n", xlab= "datetime", ylab="Voltage"))
with (pwr2, lines(Time, Voltage))

with (pwr2, plot(Time, Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n"))
with (pwr2, points(Time, Sub_metering_1, type="s"))
with (pwr2, points(Time, Sub_metering_2, type="s", col="red"))
with (pwr2, points(Time, Sub_metering_3, type="s", col="blue"))
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "blue","red"),
       cex=0.3)

with (pwr2,plot(Time, Global_reactive_power, type="n",xlab= "datetime", ylab="Global_reactive_power"))
with (pwr2, lines(Time, Global_reactive_power))
dev.off()


