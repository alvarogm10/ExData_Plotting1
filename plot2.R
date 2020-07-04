#Plot 2
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc <- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
gap <-as.numeric(hpc$Global_active_power)
gap <- gap[!is.na(gap)]
ti <- strptime(hpc$Time,format="%H:%M:%S")
ti[1:1440] <- format(ti[1:1440],"2007-02-01 %H:%M:%S")
ti[1441:2880] <- format(ti[1441:2880],"2007-02-02 %H:%M:%S")
#Plot
png("plot2.png",width=480,height=480)
plot(ti,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

