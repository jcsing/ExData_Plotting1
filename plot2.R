#EDA Course Assignment 1
#6th December 2014-John Curry
#inputs some open data, does some preprocessing and makes a plot using Base Package
pwr <-read.csv("c:/r/eda/pwr.txt", sep=";", na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
pwr$Date <-as.Date(pwr$Date, "%d/%m/%Y")
pwr$Time<-strptime(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
pwr2<- subset(pwr,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Plot 2. Time Vs Global Active Power with connecting lines and no points
png(file="C:/Users/jcurry/Documents/GitHub/ExData_Plotting1/plot2.png",width=480,height=480)

with (pwr2,plot(Time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)"))
with (pwr2, lines(Time, Global_active_power))
dev.off()