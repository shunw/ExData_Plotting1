start<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
d=read.table("household_power_consumption.txt", sep=";", header=F, skip=start, nrow=end)
a=read.table("household_power_consumption.txt", sep=";", header=T, nrow=1)
colnames(d)=colnames(a)

time<-paste(d$Date, d$Time)
time1<-strptime(time, "%d/%m/%Y %H:%M:%S")
d$actual_time<-time1


png(filename = "plot3.png",width = 480, height = 480)

plot(d$actual_time, d$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering")
lines(d$actual_time, d$Sub_metering_2, type="l", col="red")
lines(d$actual_time, d$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.off()
