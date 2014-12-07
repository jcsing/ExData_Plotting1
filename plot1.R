#EDA Course Assignment 1
#6th December 2014-John Curry
#inputs some open data, does some preprocessing and makes a plot using Base Package
pwr <-read.csv("c:/r/eda/pwr.txt", sep=";", na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
pwr$Date <-as.Date(pwr$Date, "%d/%m/%Y")
pwr$Time<-strptime(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
pwr2<- subset(pwr,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#1.Histogram of Global Active Power 
png(file="C:/Users/jcurry/Documents/GitHub/ExData_Plotting1/plot1.png",width=480,height=480)
hist(pwr2$Global_active_power, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)", col="red")
dev.off()