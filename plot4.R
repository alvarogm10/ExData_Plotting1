#Plot 4
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc <- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
#Global active power
gap <- as.numeric(hpc$Global_active_power) 
#Energy sub metering
sm1 <-as.numeric(hpc$Sub_metering_1)
sm2 <-as.numeric(hpc$Sub_metering_2)
sm3 <-as.numeric(hpc$Sub_metering_3)
#Voltage
vol <- as.numeric(hpc$Voltage)
#Global reactive power
grp <- as.numeric(hpc$Global_reactive_power)


ti <- strptime(hpc$Time,format="%H:%M:%S")
ti[1:1440] <- format(ti[1:1440],"2007-02-01 %H:%M:%S")
ti[1441:2880] <- format(ti[1441:2880],"2007-02-02 %H:%M:%S")
#Plot
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
#Plot (1,1)
plot(ti,gap,type="l",xlab="",ylab="Global Active Power")
#Plot(2,1)
plot(ti,sm1,"n",xlab="",ylab="Energy sub metering")
lines(ti,sm1)
lines(ti,sm2,col="red")
lines(ti,sm3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#Plot(1,2)
plot(ti,vol,type="l",xlab="",ylab="Voltage")
#Plot(2,2)
plot(ti,grp,type="l",xlab="",ylab="Global Reactive Power")
dev.off()


