#Plot 3
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc <- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
sm1 <-as.numeric(hpc$Sub_metering_1)
sm2 <-as.numeric(hpc$Sub_metering_2)
sm3 <-as.numeric(hpc$Sub_metering_3)
ti <- strptime(hpc$Time,format="%H:%M:%S")
ti[1:1440] <- format(ti[1:1440],"2007-02-01 %H:%M:%S")
ti[1441:2880] <- format(ti[1441:2880],"2007-02-02 %H:%M:%S")
#Plot
png("plot3.png",width=480,height=480)
plot(ti,sm1,"n",xlab="",ylab="Energy sub metering")
lines(ti,sm1)
lines(ti,sm2,col="red")
lines(ti,sm3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()

