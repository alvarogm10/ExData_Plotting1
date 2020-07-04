#Plot 1
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc <- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
gap <-as.numeric(hpc$Global_active_power)
gap <- gap[!is.na(gap)]
png("plot1.png",width=480,height=480)
hist(gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()

